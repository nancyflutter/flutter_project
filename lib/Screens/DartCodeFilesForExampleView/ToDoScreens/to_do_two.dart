import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoTwo extends StatefulWidget {
  const ToDoTwo({Key? key}) : super(key: key);

  @override
  State<ToDoTwo> createState() => _ToDoTwoState();
}

class _ToDoTwoState extends State<ToDoTwo> with TickerProviderStateMixin {
  List<Todo> items = <Todo>[];
  GlobalKey<AnimatedListState> animatedListKey = GlobalKey<AnimatedListState>();
  AnimationController? emptyListController;

  @override
  void initState() {
    emptyListController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    emptyListController!.forward();
    _loadTodoItems();
    super.initState();
  }

  void _loadTodoItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? todoList = prefs.getStringList('todoList');
    if (todoList != null) {
      setState(() {
        items = todoList.map((json) => Todo.fromMap(jsonDecode(json))).toList();
      });
    }
  }

  void _saveTodoItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> todoList =
        items.map((todo) => jsonEncode(todo.toMap())).toList();
    await prefs.setStringList('todoList', todoList);
  }

  @override
  void dispose() {
    emptyListController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: Colors.black,
              onPressed: () => goToNewItemView(),
              icon: const Icon(Icons.add),
            ),
          ),
        ),
        body: renderBody(),
      ),
    );
  }

  Widget renderBody() {
    if (items.isNotEmpty) {
      return buildListView();
    } else {
      return emptyList();
    }
  }

  Widget emptyList() {
    return Center(
      child: FadeTransition(
        opacity: emptyListController!,
        child: const Text('No items'),
      ),
    );
  }

  Widget buildListView() {
    return AnimatedList(
      key: animatedListKey,
      initialItemCount: items.length,
      itemBuilder: (BuildContext context, int index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: buildItem(items[index], index),
        );
      },
    );
  }

  Widget buildItem(Todo item, int index) {
    return Dismissible(
      key: Key('${item.hashCode}'),
      background: Container(
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      onDismissed: (direction) => removeItemFromList(item, index),
      direction: DismissDirection.horizontal,
      secondaryBackground: Container(
        color: Colors.green,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final bool res = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                      "Are you sure you want to delete ${items[index].title}?"),
                  actions: [
                    TextButton(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        removeItemFromList(item, index);
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              });
          return res;
        } else if (direction == DismissDirection.endToStart) {
          goToEditItemView(item);
          return false; // Prevent the dismiss animation
        }
        return false;
      },
      child: InkWell(
        onTap: () {
          if (kDebugMode) {
            print("${item.title} clicked");
          }
        },
        child: ListTile(
          onTap: () => changeItemCompleteness(item),
          title: Text(
            "${item.title}",
            key: Key('item-$index'),
            style: TextStyle(
              color: item.completed ? Colors.grey : Colors.black,
              decoration: item.completed ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Icon(
            item.completed ? Icons.check_box : Icons.check_box_outline_blank,
            key: Key('completed-icon-$index'),
          ),
        ),
      ),
    );
  }

  void changeItemCompleteness(Todo item) {
    setState(() {
      item.completed = !item.completed;
    });
  }

  void goToNewItemView() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const NewTodoView();
    })).then((title) {
      if (title != null) {
        addItem(Todo(title: title));
      }
      setState(() {});
    });
  }

  void addItem(Todo item) {
    items.insert(0, item);
    if (animatedListKey.currentState != null) {
      animatedListKey.currentState!.insertItem(0);
    }
    _saveTodoItems(); // Save todo items after adding a new one
  }

  void goToEditItemView(Todo item) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewTodoView(item: item);
    })).then((title) {
      if (title != null) {
        editItem(item, title);
      }
    });
  }

  void editItem(Todo item, String title) {
    setState(() {
      item.updateTitle(title);
    });
    _saveTodoItems(); // Save todo items after editing an existing one
  }

  void removeItemFromList(Todo item, int index) {
    animatedListKey.currentState?.removeItem(index, (context, animation) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    });
    deleteItem(item);
  }

  void deleteItem(Todo item) {
    items.remove(item);
    if (items.isEmpty) {
      emptyListController!.reset();
      setState(() {});
      emptyListController!.forward();
    }
    _saveTodoItems(); // Save todo items after deleting one
  }
}

class Todo {
  String? title;
  bool completed;

  Todo({
    this.title,
    this.completed = false,
  });

  Todo.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        completed = map['completed'];

  void updateTitle(String title) {
    this.title = title;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'completed': completed,
    };
  }
}

class NewTodoView extends StatefulWidget {
  final Todo? item;

  const NewTodoView({Key? key, this.item}) : super(key: key);

  @override
  State<NewTodoView> createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NewTodoView> {
  TextEditingController? titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.item != null ? widget.item!.title : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item != null ? 'Edit todo' : 'New todo',
          key: const Key('new-item-title'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              onEditingComplete: submit,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    submit();
                  });
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Theme.of(context)
                          .primaryTextTheme
                          .displayLarge!
                          .color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop(titleController!.text);
  }
}


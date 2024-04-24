import 'package:flutter/material.dart';

class ToDoThree extends StatefulWidget {
  const ToDoThree({super.key});

  @override
  State<ToDoThree> createState() => _ToDoThreeState();
}

class _ToDoThreeState extends State<ToDoThree> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<TaskList> tasks = [];

  void addItem(String taskName) {
    final index = tasks.length;
    tasks.add(TaskList(taskName));
    listKey.currentState!.insertItem(index);
  }

  void removeItem(int index) {
    final removedItem = tasks.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedItem, animation),
    );
  }

  Widget _buildRemovedItem(TaskList task, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(task.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: listKey,
              initialItemCount: tasks.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(tasks[index], animation, index);
              },
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Colors.black,
            onPressed: () {
              _showAddTaskDialog(context);
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add Task',
          ),
        ),
      ),
    );
  }

  Widget _buildItem(TaskList task, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(task.name),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () {
                _showEditTaskDialog(context, index); // Show the edit dialog on button press
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                removeItem(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditTaskDialog(BuildContext context, int index) {
    String editedTaskName = tasks[index].name;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            onChanged: (value) {
              editedTaskName = value;
            },
            decoration: const InputDecoration(hintText: 'Enter task name',),
            controller: TextEditingController(text: tasks[index].name),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (editedTaskName.trim().isNotEmpty) {
                  setState(() {
                    tasks[index].name = editedTaskName;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }


  void _showAddTaskDialog(BuildContext context) {
    String taskName = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              taskName = value;
            },
            decoration: const InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskName.trim().isNotEmpty) {
                  addItem(taskName);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class TaskList {
  String name;

  TaskList(this.name);
}

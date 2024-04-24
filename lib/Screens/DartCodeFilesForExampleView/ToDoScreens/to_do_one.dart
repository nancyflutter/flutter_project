import 'package:flutter/material.dart';

class ToDoOne extends StatefulWidget {
  const ToDoOne({super.key});

  @override
  State<ToDoOne> createState() => _ToDoOneState();
}

class _ToDoOneState extends State<ToDoOne> {
  List<String> todos = [];

  void addTodo(String todo) {
    setState(() {
      todos.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index]),
            );
          },
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTodoScreen(addTodo),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class AddTodoScreen extends StatefulWidget {
  final Function(String) addTodoCallback;

  const AddTodoScreen(this.addTodoCallback, {super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Write ToDo item...',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String todo = _controller.text.trim();
                if (todo.isNotEmpty) {
                  widget.addTodoCallback(todo);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}

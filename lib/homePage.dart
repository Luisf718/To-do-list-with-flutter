import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [
    Task(
        title: "Lavar la ropa",
        description: "a las 9am lavar la ropa de ejercicio"),
  ];

  void _addTask(dynamic newTask) {
    if (newTask is Task) {
      setState(() {
        _tasks.add(newTask);
      });
    }
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: ((context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTask(task),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((newTask) {
            if (newTask != null) {
              _addTask(newTask);
            }
          });
          //Navigator.pushNamed(context, "/add");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

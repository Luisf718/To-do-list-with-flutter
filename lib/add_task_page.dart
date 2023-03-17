import 'package:flutter/material.dart';

import 'homePage.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _addTask() {
    final newTask = Task(
        title: titleController.text, description: descriptionController.text);
    Navigator.pop(context, newTask);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar tarea")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Titulo de Tarea",
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Descripción",
              ),
            ),
            const SizedBox(height: 16.0),
            FractionallySizedBox(
              alignment: Alignment.topLeft,
              widthFactor: 0.3,
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size(160, 50))),
                onPressed: () {
                  _addTask();
                },
                child: Row(
                  children: const [Icon(Icons.add), Text("Agregar Tarea")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

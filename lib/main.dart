import 'add_task_page.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/add": (context) => const AddTaskPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: HomePage(),
    );
  }
}

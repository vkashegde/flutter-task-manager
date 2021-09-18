import 'package:flutter/material.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/auth/login.dart';
import 'package:task_management/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TasksScreen(),
    );
  }
}

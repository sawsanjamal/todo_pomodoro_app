import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/screens/sign_up_screen.dart';
import 'package:todo_app/screens/task_screen.dart';
import 'package:todo_app/models/timer_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<TaskData>(create: (context) => TaskData()),
      ChangeNotifierProvider(create: (context) => timerservice()),
    ], child: const MaterialApp(home: TaskScreen()));
  }
}

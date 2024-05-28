import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/screens/sign_up_screen.dart';
import 'package:todo_app/models/timer_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/themes/light_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TaskData>(create: (context) => TaskData()),
          ChangeNotifierProvider(create: (context) => TimerService()),
        ],
        child: MaterialApp(
          home: const SignupPage(),
          theme: lightTheme,
        ));
  }
}

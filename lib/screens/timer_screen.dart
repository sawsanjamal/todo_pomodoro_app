import 'package:flutter/material.dart';

import 'package:todo_app/widgets/timer_progress.dart';
import 'package:todo_app/widgets/time_controller.dart';

import 'package:todo_app/widgets/timer_card.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen(
      {super.key,
      required this.taskTitle,
      required this.taskPomodoro,
      required this.taskMinutes});
  final String taskTitle;
  final int taskPomodoro;
  final int taskMinutes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.lightBlueAccent[100]!,
              Colors.lightGreenAccent[100]!
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              taskTitle,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 40,
                inherit: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TimerCard(
              taskMinutes: taskMinutes,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 50,
            ),
            const timeController(),
            const SizedBox(
              height: 30,
            ),
            TimerProgress(totalRounds: taskPomodoro),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

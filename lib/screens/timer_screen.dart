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
  final double taskMinutes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.primary
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              taskTitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
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
            const TimeController(),
            const SizedBox(
              height: 60,
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

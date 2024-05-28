import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/models/timer_service.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => TimeControllerState();
}

class TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return TextButton.icon(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary)),
      onPressed: () {
        provider.timerPlaying
            ? Provider.of<TimerService>(context, listen: false).pause()
            : Provider.of<TimerService>(context, listen: false).start();
      },
      icon: provider.timerPlaying
          ? Icon(
              Icons.pause,
              size: 30,
              color: Theme.of(context).colorScheme.onSecondary,
            )
          : Icon(
              Icons.play_arrow_sharp,
              size: 30,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      label: provider.timerPlaying
          ? Text(
              'Pause',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            )
          : Text(
              'Resume',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
    );
  }
}

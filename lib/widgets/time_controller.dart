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
          backgroundColor: MaterialStateProperty.all(Colors.grey[100])),
      onPressed: () {
        provider.timerPlaying
            ? Provider.of<TimerService>(context, listen: false).pause()
            : Provider.of<TimerService>(context, listen: false).start();
      },
      icon: provider.timerPlaying
          ? const Icon(
              Icons.pause,
              size: 30,
              color: Colors.black54,
            )
          : const Icon(
              Icons.play_arrow_sharp,
              size: 30,
              color: Colors.black54,
            ),
      label: provider.timerPlaying
          ? const Text(
              'Pause',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            )
          : const Text(
              'Resume',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
    );
  }
}

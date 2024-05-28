import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/timer_service.dart';

class TimerProgress extends StatelessWidget {
  const TimerProgress({super.key, required this.totalRounds});

  final int totalRounds;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/$totalRounds",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text('ROUNDS',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary)),
      ],
    );
  }
}

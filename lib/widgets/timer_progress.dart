import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/timer_service.dart';

class TimerProgress extends StatelessWidget {
  const TimerProgress({super.key, required this.totalRounds});

  final int totalRounds;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<timerservice>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/$totalRounds",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'ROUNDS',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ],
    );
  }
}

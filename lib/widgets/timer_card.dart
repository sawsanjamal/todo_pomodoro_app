import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/timer_service.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({
    super.key,
    required this.taskMinutes,
  });
  final double taskMinutes;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Text(
          provider.currentState,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0),
                ),
                child: Row(
                  children: [
                    Text(
                      (provider.currentduration ~/ 60).toString(),
                      style: TextStyle(
                          color: renderColor(provider.currentState),
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[100]!),
                    ),
                    Text(
                      (provider.currentduration % 60) == 0
                          ? "${(provider.currentduration % 60).round()}0"
                          : (provider.currentduration % 60).round().toString(),
                      style: TextStyle(
                          color: renderColor(provider.currentState),
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}

Color renderColor(String currentState) {
  if (currentState == "FOCUS") {
    return Colors.lightBlueAccent[100]!;
  } else {
    return Colors.lightGreenAccent[100]!;
  }
}

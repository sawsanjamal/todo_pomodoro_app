import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:todo_app/screens/timer_screen.dart';

class CustomTaskTile extends StatelessWidget {
  const CustomTaskTile(
      {required this.isChecked,
      required this.taskTile,
      required this.taskNote,
      required this.pomodoroSelected,
      required this.minutesSelected,
      required this.selectedDate,
      required this.checkboxCallback,
      required this.deleteTask,
      super.key});
  final bool isChecked;
  final int pomodoroSelected;
  final int minutesSelected;
  final String selectedDate;
  final String taskNote;
  final String taskTile;
  final void Function(bool?) checkboxCallback;
  final void Function() deleteTask;

  @override
  Widget build(BuildContext context) {
    final int totalMinutes = pomodoroSelected * minutesSelected;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: SizedBox(
            height: 160,
            child: Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      value: isChecked,
                      activeColor: Colors.lightBlueAccent[400],
                      onChanged: checkboxCallback),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            taskTile,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: isChecked
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            taskNote,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                decoration: isChecked
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$pomodoroSelected x $minutesSelected = $totalMinutes minutes',
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          selectedDate,
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerScreen(
                                        taskMinutes: minutesSelected,
                                        taskTitle: taskTile,
                                        taskPomodoro: pomodoroSelected,
                                      )));
                        },
                      ),
                      IconButton(
                          onPressed: deleteTask,
                          icon: const Icon(
                            Icons.delete,
                            size: 25,
                          ))
                    ],
                  )
                ],
              ),
            )));
  }
}

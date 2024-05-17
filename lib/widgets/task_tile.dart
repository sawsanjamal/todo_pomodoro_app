import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/timer_service.dart';

import 'package:todo_app/screens/timer_screen.dart';

class CustomTaskTile extends StatefulWidget {
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
  final double minutesSelected;
  final String selectedDate;
  final String taskNote;
  final String taskTile;
  final void Function(bool?) checkboxCallback;
  final void Function() deleteTask;

  @override
  State<CustomTaskTile> createState() => _CustomTaskTileState();
}

class _CustomTaskTileState extends State<CustomTaskTile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    final double totalMinutes =
        widget.pomodoroSelected * widget.minutesSelected;
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
                      value: widget.isChecked,
                      activeColor: Colors.lightBlueAccent[400],
                      onChanged: widget.checkboxCallback),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            widget.taskTile,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: widget.isChecked
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            widget.taskNote,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                                decoration: widget.isChecked
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${widget.pomodoroSelected} x ${widget.minutesSelected} = $totalMinutes minutes',
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.selectedDate,
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
                          setState(() {
                            provider.currentduration =
                                widget.minutesSelected * 60;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerScreen(
                                        taskMinutes: widget.minutesSelected,
                                        taskTitle: widget.taskTile,
                                        taskPomodoro: widget.pomodoroSelected,
                                      )));
                        },
                      ),
                      IconButton(
                          onPressed: widget.deleteTask,
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

import 'package:todo_app/widgets/color_container.dart';
import 'package:todo_app/widgets/date_input_field.dart';
import 'package:todo_app/widgets/input_field.dart';
import 'package:todo_app/widgets/minutes_list.dart';
import 'package:todo_app/widgets/scrollable_list.dart';
import 'package:todo_app/widgets/small_input.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key, required this.selectedDate});
  DateTime selectedDate;
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2026));
    if (_pickerDate != null) {
      setState(() {
        widget.selectedDate = _pickerDate;
      });
    }
  }

  onChanged(date) {
    setState(() {
      widget.selectedDate = date;
    });
  }

  String newTaskTitle = "";
  String newTaskNote = '';
  int newPomodoro = 1;
  double newMinutes = 25;

  onChangedMinutes(value) {
    setState(() {
      double newValue = value.toDouble();
      newMinutes = newValue;
    });
  }

  onChangedPomodoro(value) {
    setState(() {
      newPomodoro = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int totalHours = newMinutes * newPomodoro ~/ 60;
    // int totalMinutes = (newMinutes * newPomodoro / totalHours).round();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        flexibleSpace: const ColorContainer(),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightBlueAccent[100]!,
                Colors.lightGreenAccent[100]!
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  width: 400,
                  height: 80,
                  child: Text(
                    "Add A New Task",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InputField(
                    hint: 'Enter your title',
                    onChanged: (value) {
                      newTaskTitle = value!;
                    },
                    title: 'Title'),
                InputField(
                    hint: 'Enter your note',
                    onChanged: (value) {
                      newTaskNote = value!;
                    },
                    title: 'Note'),
                DateInputField(
                  hint: DateFormat.yMd().format(widget.selectedDate),
                  onChanged: onChanged,
                  title: 'Date',
                  onPressed: getDateFromUser,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SmallInput(title: 'Estimated Pomodoro'),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: ScrollableList(
                              setPomodoro: onChangedPomodoro,
                            )),
                      ],
                    ),
                    const SizedBox(width: 90),
                    Column(
                      children: [
                        const SmallInput(title: 'Pomodoro Length'),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: MinutesList(
                              setMinutes: onChangedMinutes,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                    'Estimated Pomodoro Time: ${newPomodoro.toString()}x${newMinutes.toString()}m = '
                    // $totalHours h $totalMinutes m',
                    ),
              ],
            ),
            const Spacer(),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey[100]),
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                'Add task',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(
                    newTaskTitle,
                    newTaskNote,
                    DateFormat.yMMMd().format(widget.selectedDate),
                    newPomodoro,
                    newMinutes);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}

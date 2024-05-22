import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/widgets/color_container.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/widgets/time_picker.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime selectedDate = DateTime.now();
  void getNewDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: IconButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.grey[100])),
                icon: const Icon(Icons.person),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                //add logout functionality
                color: Colors.black54,
              ))
        ],
        flexibleSpace: const ColorContainer(),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.lightBlueAccent[100]!,
              Colors.lightGreenAccent[100]!
            ])),
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMd().format(selectedDate),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      const Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            height: 950,
                            child: AddTaskScreen(
                              selectedDate: selectedDate,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            TimePicker(
              selectedDate: selectedDate,
              getSelectedDate: getNewDate,
            ),
            const SizedBox(height: 20),
            Expanded(
                child: TasksList(
              selectedDate: selectedDate,
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  late String imageUrl;
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    imageUrl = '';
    // getImageUrl();
  }

  // Future<void> getImageUrl() async {
  //   final info = db.collection('userProfile');
  //   final snapshot = await info.doc().get();
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   final url = data['imageUrl'];
  //   print(url);
  //   setState(() {
  //     imageUrl = url;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: IconButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondary)),
                icon: (imageUrl == "")
                    ? const Icon(Icons.person)
                    : CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                //add logout functionality
                color: Theme.of(context).colorScheme.onSecondary,
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
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.background,
            ])),
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMd().format(selectedDate),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          )),
                      Text(
                        "Welcome {username}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  label: Text(
                    'Add task',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
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

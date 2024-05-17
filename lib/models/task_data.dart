import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      name: 'Buy bla bla bla',
      note: "",
      date: DateFormat.yMMMd().format(DateTime.now()),
      minutes: 25,
      pomodoro: 1,
    ),
    Task(
      name: 'Buy eggs',
      note: "",
      date: DateFormat.yMMMd().format(DateTime.now()),
      minutes: 25,
      pomodoro: 1,
    ),
    Task(
      name: 'Buy bread',
      note: "",
      date: DateFormat.yMMMd().format(DateTime.now()),
      minutes: 25,
      pomodoro: 1,
    ),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get tasksByDay {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(
    String newTaskTitle,
    String newTaskNote,
    String newDate,
    int newPomodoro,
    double newMinutes,
  ) {
    _tasks.add(Task(
        name: newTaskTitle,
        note: newTaskNote,
        date: newDate,
        minutes: newMinutes,
        pomodoro: newPomodoro));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

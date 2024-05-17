import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.selectedDate});
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return CustomTaskTile(
                isChecked: task.isDone,
                taskTile: task.name,
                taskNote: task.note,
                minutesSelected: task.minutes,
                pomodoroSelected: task.pomodoro,
                selectedDate: task.date,
                checkboxCallback: (bool? checkboxState) {
                  taskData.updateTask(task);
                },
                deleteTask: () {
                  taskData.deleteTask(task);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

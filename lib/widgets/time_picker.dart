import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  TimePicker(
      {super.key, required this.selectedDate, required this.getSelectedDate});

  final DateTime selectedDate;
  final void Function(DateTime) getSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: DatePicker(DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectedTextColor: Colors.grey[600]!,
          monthTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          dateTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          dayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectionColor: Colors.white.withOpacity(0.7),
          onDateChange: getSelectedDate),
    );
  }
}

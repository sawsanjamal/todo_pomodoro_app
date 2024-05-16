class Task {
  final String name;
  bool isDone;
  final String note;
  final int pomodoro;
  final int minutes;
  String date;
  Task({
    required this.name,
    required this.note,
    required this.date,
    required this.pomodoro,
    required this.minutes,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}

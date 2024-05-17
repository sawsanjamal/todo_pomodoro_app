import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  late double currentduration;
  late double selectedTime;
  bool timerPlaying = false;
  int rounds = 0;

  String currentState = "FOCUS";

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentduration == 0) {
        handleNextRound();
      } else {
        currentduration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentduration = selectedTime;

    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentduration = seconds;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentduration = 300;
      selectedTime = 300;
      rounds++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentduration;
      selectedTime;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONG BREAK";
      currentduration = 1500;
      selectedTime = 1500;
      rounds++;
    } else if (currentState == "LONG BREAK") {
      currentState = "FOCUS";
      currentduration;
      selectedTime;
      rounds = 0;
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreenAccent[100]!,
              Colors.lightBlueAccent[100]!
            ]),
      ),
    );
  }
}

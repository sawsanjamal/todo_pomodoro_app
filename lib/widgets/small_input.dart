import 'package:flutter/material.dart';

class SmallInput extends StatelessWidget {
  const SmallInput({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}

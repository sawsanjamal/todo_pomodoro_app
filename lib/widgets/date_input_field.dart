import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  const DateInputField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.title,
    required this.onPressed,
  });

  final String hint;
  final String title;
  final void Function(String?) onChanged;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    TextFormField(
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: hint,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100]!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100]!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.edit_calendar_outlined))
      ],
    );
  }
}

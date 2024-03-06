// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged;

  ToDoList({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 31, 40, 47),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Color.fromARGB(255, 47, 47, 47),
                checkColor: Color.fromARGB(255, 255, 255, 255),
              ),

              // Task name
              Text(
                taskName,
                style: TextStyle(
                  color: taskStatus
                      ? Color.fromARGB(255, 208, 208, 208)
                      : Colors.white,
                  fontSize: 18,
                  decoration: taskStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/util/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onAddTask;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onAddTask,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 31, 40, 47),
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ), // Adjust the vertical padding
                border: OutlineInputBorder(),
                hintText: "Add New Task!",
                hintStyle: TextStyle(
                    color: Color.fromARGB(
                        255, 146, 139, 139)), // Set hint text color to white
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Add Task", onPressed: onAddTask),
                const SizedBox(width: 10),
                Button(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/util/dialogBox.dart';

import '../util/todotiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Buy a juicebox", false],
    ["Meet friends at 4pm!", true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void addTask() {
    setState(() {
      if (_controller.text.isEmpty) {
        Navigator.of(context).pop();
        return;
      }
      toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onAddTask: addTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void removeTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(243, 243, 243, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 40, 47),
        title: const Center(
          child: Text(
            "To Do List",
            style: TextStyle(
              color: Colors.white,
              // fontFamily: '',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask();
        },
        backgroundColor:
            Color.fromARGB(255, 54, 79, 98), // Set your desired color here
        // ignore: prefer_const_constructors
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskStatus: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            remove: (context) => removeTask(index),
          );
        },
      ),
    );
  }
}

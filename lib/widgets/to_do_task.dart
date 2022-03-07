// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ToDoTask extends StatefulWidget {
  String task;
  var checked = false;
  ToDoTask({required this.task});

  @override
  _ToDoTaskState createState() => _ToDoTaskState();
}

class _ToDoTaskState extends State<ToDoTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: widget.checked,
            onChanged: (bool? newValue) =>
                setState(() => widget.checked = newValue!),
          ),
          Text(
            widget.task,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

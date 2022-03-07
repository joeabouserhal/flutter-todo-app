import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/to_do_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _taskList = <Widget>[];
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        centerTitle: true,
      ),
      body: Column(children: _taskList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              title: const Text('Add a new task'),
              content: TextField(
                onChanged: (value) {
                  valueText = value;
                },
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Task Name"),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        codeDialog = valueText;
                        addTask(codeDialog);
                        resetTextValues();
                        _textFieldController.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Add')),
              ],
            ),
          );
        });
  }

  void resetTextValues() {
    valueText = '';
    codeDialog = '';
  }

  String valueText = '';
  String codeDialog = '';

  addTask(String task) {
    // TODO: Add a new task to the list
    // ignore: avoid_print
    setState(() {
      _taskList.add(ToDoTask(
        task: task,
      ));
    });
    print('task added');
  }
}

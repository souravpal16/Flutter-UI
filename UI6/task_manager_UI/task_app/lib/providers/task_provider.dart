import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import '../models/task.dart';
import '../services/network.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return _tasks;
  }

  int get taskCount {
    return _tasks.length;
  }

  Future<String> populateTasks() async {
    List<dynamic> tasks = await readTasks();
    _tasks = [];
    tasks.forEach(
      (element) {
        _tasks.add(
          Task(
            title: element['title'],
            isCompleted: element['isCompleted'],
          ),
        );
      },
    );
    return 'Done';
  }

  void addTask(String title) async {
    _tasks.add(Task(title: title));
    notifyListeners();
    await createTaskOnServer(title);
  }

  void changeTaskTitle(int index, String newTitle) async {
    _tasks[index].changeTitle(newTitle);
    notifyListeners();
    //updateToServer(title);
  }

  void changeTaskStatus(int index) async {
    _tasks[index].changeStatus();
    notifyListeners();
    //updateToServer(title);
  }
}

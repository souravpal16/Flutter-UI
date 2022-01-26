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
            id: element['_id'],
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
    final task = await createTaskOnServer(title);
    String id = task['_id'];
    _tasks[_tasks.length - 1].setId = id;
  }

  void changeTaskTitle(int index, String newTitle) async {
    _tasks[index].changeTitle(newTitle);
    notifyListeners();
    Map<String, dynamic> updates = {
      'title': newTitle,
    };
    await updateTaskOnServer(_tasks[index].id, updates);
  }

  void changeTaskStatus(int index) async {
    _tasks[index].changeStatus();
    notifyListeners();
    Map<String, dynamic> updates = {
      'isCompleted': _tasks[index].isCompleted,
    };
    await updateTaskOnServer(_tasks[index].id, updates);
  }
}

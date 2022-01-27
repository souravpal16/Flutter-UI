import 'package:flutter/material.dart';
import 'package:task_app/constants.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskData>(context).tasks;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Text(
            'TODAY\'s TASKS',
            //'${tasks.length} Tasks',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            //print(tasks[index].isCompleted);
            bool status = tasks[index].isCompleted;
            return GestureDetector(
              onDoubleTap: () {
                Provider.of<TaskData>(context, listen: false)
                    .changeTaskStatus(index);
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: TaskTileWidget(
                  status: status,
                  task: tasks[index],
                  index: index,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({
    Key? key,
    required this.status,
    required this.task,
    required this.index,
  }) : super(key: key);

  final bool status;
  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(task.id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
        ),
      ),
      onDismissed: (DismissDirection direction) {
        Provider.of<TaskData>(context, listen: false).removeTask(task);
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        margin: EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(
            15,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 2),
              color: Colors.black26,
              //blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Provider.of<TaskData>(context, listen: false)
                    .changeTaskStatus(index);
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: status
                    ? Icon(
                        Icons.done,
                        color: Colors.black,
                        size: 20,
                      )
                    : null,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              task.title,
              style: TextStyle(
                fontSize: 20,
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

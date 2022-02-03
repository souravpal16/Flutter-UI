import 'package:flutter/material.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskListHeadingWidget(),
        FutureBuilder<String>(
            future: getTasks(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainTaskListWidget();
              } else if (snapshot.hasError) {
                return Text('Could not load tasks');
              }
              return CircularProgressIndicator();
            }),
        //MainTaskListWidget(),
      ],
    );
  }
}

Future<String> getTasks(BuildContext context) async {
  final ans =
      await Provider.of<TaskData>(context, listen: false).populateTasks();
  return ans;
}

class MainTaskListWidget extends StatelessWidget {
  const MainTaskListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskData>(context).tasks;
    return ListView.builder(
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
            margin: const EdgeInsets.symmetric(
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
    );
  }
}

class TaskListHeadingWidget extends StatelessWidget {
  const TaskListHeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: const Text(
        'TODAY\'S TASKS',
        //'${tasks.length} Tasks',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
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
        child: const Icon(
          Icons.delete,
        ),
      ),
      onDismissed: (DismissDirection direction) {
        Provider.of<TaskData>(context, listen: false).removeTask(task);
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
        ),
        margin: const EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(
            15,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              color:
                  Theme.of(context).textTheme.bodyText2?.color ?? Colors.black,
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
                    color: Theme.of(context).textTheme.bodyText2?.color ??
                        Colors.black,
                    width: 2.0,
                  ),
                ),
                child: status
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).textTheme.bodyText2?.color,
                        size: 20,
                      )
                    : null,
              ),
            ),
            const SizedBox(
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

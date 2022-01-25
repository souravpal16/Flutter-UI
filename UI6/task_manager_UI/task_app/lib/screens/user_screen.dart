import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import './add_task_screen.dart';

Future<String> loadName() async {
  String name;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //token = prefs.getString('token') ?? 'error';
  name = prefs.getString('name') ?? 'error';
  print('Name: ' + name);
  //print('Token: ' + token);

  return name;
}

class UserScreen extends StatefulWidget {
  static const String routeName = "/user_screen";

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: KIcon,
          onPressed: () {},
        ),
        backgroundColor: KbackgroundColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionbuttonWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userNameTextWidget(),
          SizedBox(height: 20),
          TaskListWidget(),
        ],
      ),
    );
  }
}

class FloatingActionbuttonWidget extends StatelessWidget {
  const FloatingActionbuttonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color6,
      child: Icon(
        Icons.add,
        color: color2,
      ),
      onPressed: () {
        Navigator.pushNamed(context, AddTaskScreen.routeName);
      },
    );
  }
}

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
        Text('${tasks.length} Tasks'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            print(tasks[index].isCompleted);
            return Text(
              tasks[index].title,
              style: TextStyle(
                fontSize: 30,
                decoration: tasks[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            );
          },
        ),
      ],
    );
  }
}

class userNameTextWidget extends StatelessWidget {
  const userNameTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadName(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Hello: ${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

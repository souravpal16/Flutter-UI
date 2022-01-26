import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  static const routeName = '/addScreen';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KbackgroundColor1,
        appBar: AppBar(
          backgroundColor: KbackgroundColor1,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: color4,
              size: 30,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: myController,
                style: TextStyle(
                  color: color3,
                ),
                cursorColor: color6,
                decoration: InputDecoration(
                  hintText: 'Create a new task',
                  focusColor: color7,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color6),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (myController.text == '') {
                        return;
                      }
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(myController.text);
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Center(
                        child: Text('Create', style: style4),
                      ),
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: color6,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

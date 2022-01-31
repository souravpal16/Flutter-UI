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
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color:
                  Theme.of(context).textTheme.bodyText2?.color ?? Colors.black,
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
                  color: Theme.of(context).textTheme.bodyText2?.color,
                ),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodyText2?.color ??
                          Colors.black,
                    ),
                  ),

                  hintText: 'Create a new task',
                  //focusColor: color7,
                  hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2?.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
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
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
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

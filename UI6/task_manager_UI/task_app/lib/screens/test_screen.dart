import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> checkConnection() async {
  String url = 'https://pal-task-manager.herokuapp.com/task';

  final response = await http.get(
    Uri.parse(url),
  );

  print(response.body);
  try {
    final obj = jsonDecode(response.body);
    return obj['result'];
    //return 'hello world';
  } catch (e) {
    return '${e}';
  }
}

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Future<String> futureString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //futureString = checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('check connection'),
          onPressed: () {
            showDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Checking connection...'),
                content: FutureBuilder<String>(
                  future: checkConnection(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text('${snapshot.data}'),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          Text('${snapshot.error}'),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    }
                    return Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    );
                  },
                ),
                // actions: <Widget>[
                //   TextButton(
                //     onPressed: () => Navigator.pop(context, 'Cancel'),
                //     child: const Text('Cancel'),
                //   ),

                // ],
              ),
            );
          },
        ),
      ),
    );
  }
}

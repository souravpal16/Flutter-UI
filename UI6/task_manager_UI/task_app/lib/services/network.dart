import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/token_shared_preference.dart';
import '../utils/set_shared_preferences.dart';

Future<String> signupUser(String name, String email, String password) async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/new';
  String url2 = 'http://192.168.29.37:3000/user/new';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'name': name,
        'email': email,
        'password': password,
      },
    ),
  );

  if (response.statusCode == 200) {
    await setSharedPreferences(response);

    return 'Done';
  }

  return "Error";
}

Future<String> loginUser(String email, String password) async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/login';
  String url2 = 'http://192.168.29.37:3000/user/login';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        'email': email,
        'password': password,
      },
    ),
  );

  if (response.statusCode == 201) {
    await setSharedPreferences(response);

    return 'Done';
  }

  throw ('Error');
}

Future<List<dynamic>> readTasks() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/all';
  String url2 = 'http://192.168.29.37:3000/task/all';

  String JWT_TOKEN = await loadToken();
  print('JWT: ' + JWT_TOKEN);

  final response = await http.get(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
  );

  final obj = jsonDecode(response.body);
  print(obj);
  return obj;
}

Future<Map<String, dynamic>> createTaskOnServer(String title) async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/new';
  String url2 = 'http://192.168.29.37:3000/task/new';

  String JWT_TOKEN = await loadToken();
  print('JWT: ' + JWT_TOKEN);

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
    body: jsonEncode(
      {'title': title},
    ),
  );

  final obj = jsonDecode(response.body);
  return obj['result'];
}

Future<void> updateTaskOnServer(String id, Map<String, dynamic> updates) async {
  String taskid1 = '';
  String taskid2 = '61f06976a4b00cdd4ad1eb81';

  String url1 = '';
  String url2 = 'http://127.0.0.1:3000/task/${id}';
  String jwt1 = '';
  String jwt2 = '';

  String url = 'http://192.168.29.37:3000/task/${id}';

  String JWT_TOKEN = await loadToken();

  final response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
    body: jsonEncode(
      updates,
    ),
  );

  final obj = jsonDecode(response.body);
  print(obj);
}
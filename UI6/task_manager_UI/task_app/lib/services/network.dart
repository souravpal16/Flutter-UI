import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../utils/token_shared_preference.dart';
import '../utils/set_shared_preferences.dart';

const String url1 = 'https://pal-task-manager.herokuapp.com';
const String url2 = 'http://192.168.29.37:3000';
String domain = url1;

Future<String> signupUser(String name, String email, String password) async {
  String url = domain + '/user/new';

  final response = await http.post(
    Uri.parse(url),
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

  throw "Error";
}

Future<String> loginUser(String email, String password) async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/login';
  String url2 = 'http://192.168.29.37:3000/user/login';
  String url = domain + '/user/login';

  final response = await http.post(
    Uri.parse(url),
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

//GET
Future<List<dynamic>> readTasks() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/all';
  String url2 = 'http://192.168.29.37:3000/task/all';

  String url = domain + '/task/all';

  String JWT_TOKEN = await loadToken();

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
  );

  final obj = jsonDecode(response.body);
  return obj;
}

//POST
Future<Map<String, dynamic>> createTaskOnServer(String title) async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/new';
  String url2 = 'http://192.168.29.37:3000/task/new';

  String url = domain + '/task/new';

  String JWT_TOKEN = await loadToken();

  final response = await http.post(
    Uri.parse(url),
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

//PUT
Future<void> updateTaskOnServer(String id, Map<String, dynamic> updates) async {
  // String url = 'http://192.168.29.37:3000/task/${id}';
  String url = domain + '/task/${id}';

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
}

//DELETE
Future<void> removeTaskFromServer(String id) async {
  // String url = 'http://192.168.29.37:3000/task/$id';
  String url = domain + '/task/${id}';

  String JWT_TOKEN = await loadToken();

  final response = await http.delete(
    Uri.parse(url),
    headers: <String, String>{
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
  );

  final obj = jsonDecode(response.body);
}

Future<void> logoutUserFromServer() async {
  // String url = 'http://192.168.29.37:3000/user/logout';
  String url = domain + '/user/logout';

  String JWT_TOKEN = await loadToken();

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
  );

  final obj = jsonDecode(response.body);
}

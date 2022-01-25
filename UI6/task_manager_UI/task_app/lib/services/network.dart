import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> signupUser() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/new';
  String url2 = 'http://192.168.29.37:3000/user/new';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'name': 'sourav',
        'email': 'jkl@gmail.com',
        'password': 'test123',
      },
    ),
  );

  if (response.statusCode == 200) {
    final obj = jsonDecode(response.body);
    String name = obj['user']['name'];
    String token = obj['token'];
    String email = obj['user']['email'];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('name', name);
    await prefs.setString('email', email);

    return 'Done';
  }

  return "Error";
}

Future<String> loginUser() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/login';
  String url2 = 'http://192.168.29.37:3000/user/login';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        'email': 'xyz@gmail.com',
        'password': 'test123',
      },
    ),
  );

  if (response.statusCode == 201) {
    final obj = jsonDecode(response.body);
    String name = obj['user']['name'];
    String token = obj['token'];
    String email = obj['user']['email'];

    print(name);
    print(token);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('name', name);
    await prefs.setString('email', email);

    return 'Done';
  }

  return "Error";
}

Future<List<dynamic>> readTasks() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/all';
  String url2 = 'http://192.168.29.37:3000/task/all';

  String jwt1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlNzgzMGViZTUxNTE1ZWFiY2UxMjAiLCJpYXQiOjE2NDMwMTgyODh9.jJ-WJa_7NOfyryRaEFM-aNmUMSO-ICkcZsD0uREsuZg';

  String jwt2 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlOGM3MGYyNzEyNDUzMjNlZjFiZGQiLCJpYXQiOjE2NDMwMjM0NzJ9.KtlXY54grIBHH8Axo_Ekm6Fnp9ySnQS5OFBH8yVE9QU';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String JWT_TOKEN = prefs.getString('token') ?? '';
  print('JWT: ' + JWT_TOKEN);
  final response = await http.get(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: JWT_TOKEN,
    },
  );
  print(response);
  final obj = jsonDecode(response.body);
  print(obj);
  return obj;
}

Future<void> createTaskOnServer(String title) async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/new';
  String url2 = 'http://192.168.29.37:3000/task/new';

  String jwt1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlNzgzMGViZTUxNTE1ZWFiY2UxMjAiLCJpYXQiOjE2NDMwMTgyODh9.jJ-WJa_7NOfyryRaEFM-aNmUMSO-ICkcZsD0uREsuZg';

  String jwt2 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlOGM3MGYyNzEyNDUzMjNlZjFiZGQiLCJpYXQiOjE2NDMwMjM0NzJ9.KtlXY54grIBHH8Axo_Ekm6Fnp9ySnQS5OFBH8yVE9QU';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String JWT_TOKEN = prefs.getString('token') ?? '';
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

  print(response.body);
  print('\n');
  final obj = jsonDecode(response.body);

  print(obj);
  print(obj.runtimeType);
  print(obj['result']['title'].runtimeType);
  print(obj['result']['isCompleted'].runtimeType);
}

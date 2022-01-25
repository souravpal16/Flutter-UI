import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  print('Hello world!');

  //await createUser();
  //await createTask();
  //await loginUser();
  //await logoutUser();
  await readTasks();
}

Future<http.Response> checkConnection() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user';
  String url2 = 'http://127.0.0.1:3000/task';
  final response = await http.get(Uri.parse(url2));

  //print(response);
  return response;
}

Future<void> createUser() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/new';
  String url2 = 'http://127.0.0.1:3000/user/new';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'name': 'sourav',
        'email': '123@gmail.com',
        'password': 'test123',
      },
    ),
  );
  print(response.body);
  print('\n');
  final obj = jsonDecode(response.body);

  print(obj);
  print(obj.runtimeType);
}

Future<void> createTask() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/new';
  String url2 = 'http://127.0.0.1:3000/task/new';

  String jwt1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlNzgzMGViZTUxNTE1ZWFiY2UxMjAiLCJpYXQiOjE2NDMwMTgyODh9.jJ-WJa_7NOfyryRaEFM-aNmUMSO-ICkcZsD0uREsuZg';

  String jwt2 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlOGM3MGYyNzEyNDUzMjNlZjFiZGQiLCJpYXQiOjE2NDMwMjM0NzJ9.KtlXY54grIBHH8Axo_Ekm6Fnp9ySnQS5OFBH8yVE9QU';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: jwt2
    },
    body: jsonEncode(
      {'title': 'A job 2'},
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

Future<void> loginUser() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/login';
  String url2 = 'http://127.0.0.1:3000/user/login';

  final response = await http.post(
    Uri.parse(url2),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      {
        'email': '123@gmail.com',
        'password': 'test123',
      },
    ),
  );

  print(response.body);
  print('\n');

  final obj = jsonDecode(response.body);

  print(obj);
  print(obj.runtimeType);
}

Future<void> logoutUser() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/user/logout';
  String url2 = 'http://127.0.0.1:3000/user/logout';

  String jwt1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlNzgzMGViZTUxNTE1ZWFiY2UxMjAiLCJpYXQiOjE2NDMwMTgyODh9.jJ-WJa_7NOfyryRaEFM-aNmUMSO-ICkcZsD0uREsuZg';

  String jwt2 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlNzljMDM5MzFhODYxMWFlZWZhZWYiLCJpYXQiOjE2NDMwMTg2OTB9.KBgIuwG-aZHvgYOt72yTCmHML3VWomP8Hi5g8PrqZHM';

  final response = await http.post(
    Uri.parse(url1),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: jwt1,
    },
  );

  print(response.body);
}

Future<void> readTasks() async {
  String url1 = 'https://pal-task-manager.herokuapp.com/task/all';
  String url2 = 'http://127.0.0.1:3000/task/all';

  String jwt1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlNzljMDM5MzFhODYxMWFlZWZhZWYiLCJpYXQiOjE2NDMxMDk3NjN9.ETlWZwi2Y_xXDsSTmpwUpPEkAjaN25LodyszpWddcwM';

  String jwt2 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWVlOGM3MGYyNzEyNDUzMjNlZjFiZGQiLCJpYXQiOjE2NDMwMjM0NzJ9.KtlXY54grIBHH8Axo_Ekm6Fnp9ySnQS5OFBH8yVE9QU';

  final response = await http.get(
    Uri.parse(url1),
    headers: {
      'content-type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: jwt1,
    },
  );

  final obj = jsonDecode(response.body);

  print(obj);
  print(obj[0]['title'].runtimeType);
  print(obj[0]['isCompleted'].runtimeType);
  print(obj[0].runtimeType);
}

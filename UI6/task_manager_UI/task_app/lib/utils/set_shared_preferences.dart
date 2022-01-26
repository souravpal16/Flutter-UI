import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

/* */

Future<void> setSharedPreferences(Response response) async {
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
}

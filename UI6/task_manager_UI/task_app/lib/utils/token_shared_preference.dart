import 'package:shared_preferences/shared_preferences.dart';

Future<String> loadToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String JWT_TOKEN = prefs.getString('token') ?? '';

  return JWT_TOKEN;
}

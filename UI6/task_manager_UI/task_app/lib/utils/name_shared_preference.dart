import 'package:shared_preferences/shared_preferences.dart';

/* Returns name of the user from the shared preferences */

Future<String> loadName() async {
  String name;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  name = prefs.getString('name') ?? 'error';

  //print('Name: ' + name);

  return name;
}

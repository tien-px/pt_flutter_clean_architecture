import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences shared;
  init() async {
    shared = await SharedPreferences.getInstance();
  }
}

final sharedPrefs = SharedPrefs();

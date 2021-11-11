import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? shared;
  init() async {
    if (shared == null) {
      shared = await SharedPreferences.getInstance();
    }
  }
}

final sharedPrefs = SharedPrefs();

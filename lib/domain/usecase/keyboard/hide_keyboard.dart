import 'package:flutter/widgets.dart';

class HideKeyboard {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
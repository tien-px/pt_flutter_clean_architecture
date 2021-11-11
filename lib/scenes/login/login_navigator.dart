import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginNavigatorType {
  void showLoginAlert();
}

class LoginNavigator implements LoginNavigatorType {
  @override
  void showLoginAlert() {
    Get.defaultDialog(
      title: "Alert",
      content: Text(
        "Login Success",
      ),
    );
  }
}

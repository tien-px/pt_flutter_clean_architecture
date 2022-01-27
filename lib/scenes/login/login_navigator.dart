import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pt_clean_architecture/assembler.dart';

abstract class LoginNavigatorType {
  void showLoginAlert();
}

class LoginNavigator implements LoginNavigatorType {
  Assembler assembler;

  LoginNavigator({required this.assembler});

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

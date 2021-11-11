import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/scenes/app/app_pages.dart';
import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';

class LoginView extends RxView<LoginViewModel> {
  late LoginVMI input;
  late LoginVMO output;

  @override
  void bindViewModel() {
    input = LoginVMI();
    output = viewModel.transform(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        onChanged: (value) => input.emailTrigger.add(value),
      ),
      SizedBox(height: 5),
      Obx(() => Text(output.emailValidationMessage.value)),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        onChanged: (value) => input.passwordTrigger.add(value),
      ),
      SizedBox(height: 5),
      Obx(() => Text(output.passwordValidationMessage.value)),
      SizedBox(height: 10)
    ];
  }

  List<Widget> buildSubmitButtons() {
    return <Widget>[
      Obx(() {
        if (output.isLoading.value) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 55,
                padding: EdgeInsets.all(15),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ],
          );
        } else {
          return ElevatedButton(
            child: Text('Login', style: TextStyle(fontSize: 20.0)),
            onPressed: () => input.loginTrigger.emit(),
          );
        }
      })
    ];
  }
}

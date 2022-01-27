import 'package:flutter/material.dart';
import 'package:pt_clean_architecture/foundation/base.dart';
import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class LoginView extends RxView<LoginViewModel> {
  late final LoginVMI input;
  late final LoginVMO output;

  LoginView({required viewModel}) : super(viewModel: viewModel);

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
        onChanged: (value) => input.emailTrigger.emit(value),
      ),
      SizedBox(height: 5),
      Obx(() => Text(output.emailValidationMessage.value)
          .defaultStyle()
          .setColor(Colors.red)),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        onChanged: (value) => input.passwordTrigger.emit(value),
      ),
      SizedBox(height: 5),
      Obx(() => Text(output.passwordValidationMessage.value)
          .defaultStyle()
          .setColor(Colors.red)),
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

import 'package:pt_clean_architecture/scenes/login/login_navigator.dart';

class LoginNavigatorMock implements LoginNavigatorType {
  var showLoginAlertCalled = false;

  @override
  void showLoginAlert() {
    showLoginAlertCalled = true;
  }
}

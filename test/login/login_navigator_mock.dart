import 'package:pt_clean_architecture/scenes/login/login_navigator.dart';

class LoginNavigatorMock implements LoginNavigatorType {
  var toTest_Called = false;

  @override
  void test() {
    toTest_Called = true;
  }

  @override
  void showLoginAlert() {
    // TODO: implement showLoginAlert
  }
}

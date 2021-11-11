import 'package:pt_architecture/src/validation/validation_result.dart';
import 'package:pt_clean_architecture/scenes/login/login_usecase.dart';

class LoginSceneUseCaseMock implements LoginSceneUseCaseType {
  @override
  ValidationResult validateEmail(String email) {
    // TODO: implement validateEmail
    throw UnimplementedError();
  }

  @override
  ValidationResult validatePassword(String password) {
    // TODO: implement validatePassword
    throw UnimplementedError();
  }

  @override
  Stream<void> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

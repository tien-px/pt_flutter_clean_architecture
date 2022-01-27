import 'package:pt_clean_architecture/domain/usecase/dto/login_dto.dart';
import 'package:pt_clean_architecture/scenes/login/login_usecase.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class LoginSceneUseCaseMock implements LoginSceneUseCaseType {
  @override
  void hideKeyboard() {}

  @override
  Stream<void> login(LoginDto dto) {
    return Stream<void>.value(null);
  }

  @override
  ValidationResult validateEmail(String email) {
    return ValidationResult.valid();
  }

  @override
  ValidationResult validatePassword(String password) {
    return ValidationResult.valid();
  }
}

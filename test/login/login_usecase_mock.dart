import 'package:pt_clean_architecture/domain/usecase/dto/login_dto.dart';
import 'package:pt_clean_architecture/scenes/login/login_usecase.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class LoginSceneUseCaseMock implements LoginSceneUseCaseType {
  final useCase = LoginSceneUseCase();
  /// Validate Email
  bool validateEmailCalled = false;
  ValidationResult? validateEmailReturnValue;

  @override
  ValidationResult validateEmail(String email) {
    validateEmailCalled = true;
    validateEmailReturnValue = validateEmailReturnValue ?? useCase.validateEmail(email);
    return validateEmailReturnValue!;
  }

  /// Validate Email
  bool validatePasswordCalled = false;
  ValidationResult? validatePasswordReturnValue;

  @override
  ValidationResult validatePassword(String password) {
    validatePasswordCalled = true;
    validatePasswordReturnValue = validatePasswordReturnValue ?? useCase.validatePassword(password);
    return validatePasswordReturnValue!;
  }

  /// Validate Email
  bool loginCalled = false;
  Stream<void> loginReturnValue = Stream<void>.value(null);

  @override
  Stream<void> login(LoginDto dto) {
    loginCalled = true;
    return loginReturnValue;
  }

  bool hideKeyboardCalled = false;
  @override
  void hideKeyboard() {
    hideKeyboardCalled = true;
  }
}

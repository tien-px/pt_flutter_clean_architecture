import 'package:pt_clean_architecture/domain/usecase/dto/login_dto.dart';
import 'package:pt_clean_architecture/domain/usecase/keyboard/hide_keyboard.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

abstract class LoginSceneUseCaseType {
  ValidationResult validateEmail(String email);
  ValidationResult validatePassword(String password);
  void hideKeyboard();
  Stream<void> login(LoginDto dto);
}

class LoginSceneUseCase
    with LoginDtoValidator, HideKeyboard
    implements LoginSceneUseCaseType {
  @override
  Stream<void> login(LoginDto dto) {
    return Stream<void>.value(null).delay(Duration(seconds: 2));
  }
}

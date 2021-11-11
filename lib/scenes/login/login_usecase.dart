import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/domain/usecase/validation/validation_usecase.dart';
import 'package:rxdart/rxdart.dart';

abstract class LoginSceneUseCaseType {
  ValidationResult validateEmail(String email);
  ValidationResult validatePassword(String password);
  Stream<void> login(String username, String password);
}

class LoginSceneUseCase
    with ValidationUseCase
    implements LoginSceneUseCaseType {
  @override
  Stream<void> login(String username, String password) {
    return Stream<void>.value(null).delay(Duration(seconds: 2));
  }
}

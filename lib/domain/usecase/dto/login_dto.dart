import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class LoginDto {
  final String email;
  final String password;

  LoginDto(this.email, this.password);
}

class LoginDtoValidator {
  ValidationResult validateEmail(String email) {
    return Validator<String>(rules: [RequiredRule(), EmailRule()])
        .validate(email);
  }

  ValidationResult validatePassword(String password) {
    return Validator<String>(rules: [RequiredRule(), MinLengthRule(6)])
        .validate(password);
  }
}
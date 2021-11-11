import 'package:get/get.dart';
import 'package:pt_architecture/pt_architecture.dart';

abstract class ValidationUseCaseType {
  ValidationResult validateEmail(String email);

  ValidationResult validatePassword(String password);

  ValidationResult validateName(String name);

  ValidationResult validateDateOfBirth(String date);
}

class ValidationUseCase implements ValidationUseCaseType {
  static final RegExp passwordRegExp = RegExp(
    r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );

  static final RegExp stringAndNumberRegExp = RegExp(
    r'^(?!^[0-9]*$)(?!^[a-zA-Z]*$)(^.*)',
  );

  static bool isEmail(String email) {
    return GetUtils.isEmail(email);
  }

  static bool isStrongPassword(String password) {
    return passwordRegExp.hasMatch(password);
  }

  static bool isStringAndNumber(String string) {
    return stringAndNumberRegExp.hasMatch(string);
  }

  @override
  ValidationResult validateStringAndNumber(String string) {
    return ValidationUseCase.isStringAndNumber(string)
        ? ValidationResult.valid()
        : ValidationResult.invalid("Not contain string and number");
  }

  @override
  ValidationResult validateEmail(String email) {
    return ValidationUseCase.isEmail(email)
        ? ValidationResult.valid()
        : ValidationResult.invalid("Email Invalid");
  }

  @override
  ValidationResult validatePassword(String password) {
    return ValidationUseCase.isStrongPassword(password)
        ? ValidationResult.valid()
        : ValidationResult.invalid("Not Strong Password");
  }

  @override
  ValidationResult validateName(String name) {
    return name.isNotEmpty
        ? ValidationResult.valid()
        : ValidationResult.invalid("Empty");
  }

  @override
  ValidationResult validateDateOfBirth(String date) {
    return date.isNotEmpty
        ? ValidationResult.valid()
        : ValidationResult.invalid("DOB Invalid");
  }

  @override
  ValidationResult validateGender(String gender) {
    switch (gender) {
      case "male":
        return ValidationResult.valid();
      case "female":
        return ValidationResult.valid();
    }
    return ValidationResult.invalid("Gender Invalid");
  }
}

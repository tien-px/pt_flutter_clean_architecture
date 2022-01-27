import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

import 'login_navigator_mock.dart';
import 'login_usecase_mock.dart';

void main() {
  late LoginNavigatorMock navigator;
  late LoginSceneUseCaseMock useCase;
  late LoginViewModel viewModel;
  late LoginVMI input;

  setUp(() {
    navigator = LoginNavigatorMock();
    useCase = LoginSceneUseCaseMock();
    viewModel = LoginViewModel(navigator: navigator, useCase: useCase);
    input = LoginVMI();
    viewModel.transform(input);
  });

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('login_test', () {
    test('hide_keyboard_when_login', () async {
      /// Arrange
      /// Act
      await emit(input.loginTrigger);

      /// Assert
      expect(useCase.hideKeyboardCalled, true);
    });
    test('validate_email', () async {
      /// Arrange
      /// Act
      await emit(input.loginTrigger);

      /// Assert
      expect(useCase.validateEmailCalled, true);
    });
    test('validate_password', () async {
      /// Arrange
      /// Act
      await emit(input.loginTrigger);

      /// Assert
      expect(useCase.validatePasswordCalled, true);
    });
    test('validate_email_failed', () async {
      /// Arrange
      /// Act
      await emit(input.emailTrigger, "123");
      await emit(input.loginTrigger);

      /// Assert
      expect(useCase.validateEmailCalled, true);
      expect(useCase.validateEmailReturnValue!.valid, false);
    });
    test('validate_password_failed', () async {
      /// Arrange
      /// Act
      await emit(input.passwordTrigger, "");
      await emit(input.loginTrigger);

      /// Assert
      expect(useCase.validatePasswordCalled, true);
      expect(useCase.validatePasswordReturnValue!.valid, false);
    });
    test('login_success', () async {
      /// Arrange
      /// Act
      await emit(input.emailTrigger, "test@gmail.com");
      await emit(input.passwordTrigger, "123456");
      await emit(input.loginTrigger);

      /// Assert
      expect(useCase.validateEmailCalled, true);
      expect(useCase.validateEmailReturnValue!.valid, true);
      expect(useCase.validatePasswordCalled, true);
      expect(useCase.validatePasswordReturnValue!.valid, true);
      expect(navigator.showLoginAlertCalled, true);
    });
  });
}

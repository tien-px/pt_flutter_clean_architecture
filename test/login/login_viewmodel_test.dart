import 'package:flutter_test/flutter_test.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

import 'login_navigator_mock.dart';
import 'login_usecase_mock.dart';

void main() {
  late LoginNavigatorMock navigator;
  late LoginSceneUseCaseMock useCase;
  late LoginViewModel viewModel;
  late LoginVMI input;
  late LoginVMO output;
  late DisposeBag bag;

  setUp(() {
    navigator = LoginNavigatorMock();
    useCase = LoginSceneUseCaseMock();
    viewModel = LoginViewModel(navigator: navigator, useCase: useCase);
    bag = DisposeBag();
    input = LoginVMI();
    output = viewModel.transform(input);
  });

  tearDown(() async {
    // await bag.dispose();
  });

  group('login_test', () {
    test('validate_email', () async {
      // Arrange
      // Act
      // await emit(loadTrigger);
      // await emit(emailTrigger);
      input.passwordTrigger.emit("");
      input.emailTrigger.emit("");
      input.loginTrigger.emit();

      await waitForEmit();

      // Assert
      expect(navigator.toTest_Called, true);
    });
  });
}

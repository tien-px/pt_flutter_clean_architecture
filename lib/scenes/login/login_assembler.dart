import 'package:pt_clean_architecture/assembler.dart';
import 'package:pt_clean_architecture/mock/login_usecase_mock.dart';

import 'login_navigator.dart';
import 'login_usecase.dart';
import 'login_view.dart';
import 'login_viewmodel.dart';

extension LoginAssembler on Assembler {
  LoginView resolveLoginView() {
    return LoginView(viewModel: _resolveLoginViewModel());
  }

  LoginViewModel _resolveLoginViewModel() {
    return LoginViewModel(
        navigator: _resolveLoginNavigator(),
        useCase: _resolveLoginSceneUseCase());
  }

  LoginNavigatorType _resolveLoginNavigator() {
    return LoginNavigator(assembler: this);
  }

  LoginSceneUseCaseType _resolveLoginSceneUseCase() {
    return Assembler.isMockEnabled ? LoginSceneUseCaseMock() : LoginSceneUseCase();
  }
}

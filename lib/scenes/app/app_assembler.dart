import 'package:pt_clean_architecture/assembler.dart';

import 'app_navigator.dart';
import 'app_usecase.dart';
import 'app_view.dart';
import 'app_viewmodel.dart';

extension AppAssembler on Assembler {
  AppView resolveAppView() {
    return AppView(viewModel: _resolveAppViewModel());
  }

  AppViewModel _resolveAppViewModel() {
    return AppViewModel(
        navigator: _resolveAppNavigator(),
        useCase: _resolveAppSceneUseCase());
  }

  AppNavigatorType _resolveAppNavigator() {
    return AppNavigator();
  }

  AppSceneUseCaseType _resolveAppSceneUseCase() {
    return AppSceneUseCase();
  }
}

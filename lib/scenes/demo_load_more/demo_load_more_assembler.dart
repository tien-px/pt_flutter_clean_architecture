import 'package:pt_clean_architecture/assembler.dart';

import 'demo_load_more_navigator.dart';
import 'demo_load_more_usecase.dart';
import 'demo_load_more_view.dart';
import 'demo_load_more_viewmodel.dart';

extension DemoLoadMoreAssembler on Assembler {
  DemoLoadMoreView resolveDemoLoadMoreView() {
    return DemoLoadMoreView(viewModel: _resolveDemoLoadMoreViewModel());
  }

  DemoLoadMoreViewModel _resolveDemoLoadMoreViewModel() {
    return DemoLoadMoreViewModel(
        navigator: _resolveDemoLoadMoreNavigator(),
        useCase: _resolveDemoLoadMoreSceneUseCase());
  }

  DemoLoadMoreNavigatorType _resolveDemoLoadMoreNavigator() {
    return DemoLoadMoreNavigator(assembler: this);
  }

  DemoLoadMoreSceneUseCaseType _resolveDemoLoadMoreSceneUseCase() {
    return DemoLoadMoreSceneUseCase();
  }
}

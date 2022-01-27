import 'package:pt_clean_architecture/assembler.dart';

import 'demo_list_navigator.dart';
import 'demo_list_usecase.dart';
import 'demo_list_view.dart';
import 'demo_list_viewmodel.dart';

extension DemoListAssembler on Assembler {
  DemoListView resolveDemoListView() {
    return DemoListView(viewModel: _resolveDemoListViewModel());
  }

  DemoListViewModel _resolveDemoListViewModel() {
    return DemoListViewModel(
        navigator: _resolveDemoListNavigator(),
        useCase: _resolveDemoListSceneUseCase());
  }

  DemoListNavigatorType _resolveDemoListNavigator() {
    return DemoListNavigator(assembler: this);
  }

  DemoListSceneUseCaseType _resolveDemoListSceneUseCase() {
    return DemoListSceneUseCase();
  }
}

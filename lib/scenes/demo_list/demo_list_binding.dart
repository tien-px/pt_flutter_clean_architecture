import 'package:get/get.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_navigator.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_usecase.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_viewmodel.dart';

class DemoListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoListViewModel>(() {
      return DemoListViewModel(
          navigator: DemoListNavigator(), useCase: DemoListSceneUseCase());
    });
  }
}

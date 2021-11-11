import 'package:get/get.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_navigator.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_usecase.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_viewmodel.dart';

class DemoLoadMoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoLoadMoreViewModel>(() {
      return DemoLoadMoreViewModel(
          navigator: DemoLoadMoreNavigator(),
          useCase: DemoLoadMoreSceneUseCase());
    });
  }
}

import 'package:get/get.dart';
import 'package:pt_clean_architecture/flavors.dart';
import 'package:pt_clean_architecture/mock/app_usecase_mock.dart';

import 'app_navigator.dart';
import 'app_usecase.dart';
import 'app_view.dart';
import 'app_viewmodel.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppViewModel>(() {
      return AppViewModel(
          navigator: AppNavigator(), useCase: AppSceneUseCase());
    });
  }
}

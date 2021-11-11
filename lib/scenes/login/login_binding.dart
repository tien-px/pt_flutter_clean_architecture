import 'package:get/get.dart';
import 'package:pt_clean_architecture/scenes/login/login_navigator.dart';
import 'package:pt_clean_architecture/scenes/login/login_usecase.dart';
import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() {
      return LoginViewModel(
          navigator: LoginNavigator(), useCase: LoginSceneUseCase());
    });
  }
}

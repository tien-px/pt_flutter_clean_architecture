import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_viewmodel.dart';

class RxDebug {
  static bool isEnabled = false;

  static void loginViewModel(LoginVMI input, LoginVMO output, DisposeBag bag) {
    if (!isEnabled) return;
    input.emailTrigger.debug("emailTrigger").subscribe().disposedBy(bag);
    input.passwordTrigger.debug("passwordTrigger").subscribe().disposedBy(bag);
    input.loginTrigger.debug("loginTrigger").subscribe().disposedBy(bag);

    output.isLoading.stream
        .debug("emailValidationMessage")
        .subscribe()
        .disposedBy(bag);
    output.emailValidationMessage.stream
        .debug("emailValidationMessage")
        .subscribe()
        .disposedBy(bag);
    output.passwordValidationMessage.stream
        .debug("emailValidationMessage")
        .subscribe()
        .disposedBy(bag);
  }

  static void demoListViewModel(
      DemoListVMI input, DemoListVMO output, DisposeBag bag) {
    if (!isEnabled) return;
    input.loadTrigger.debug("loadTrigger").subscribe().disposedBy(bag);
    input.reloadTrigger.debug("reloadTrigger").subscribe().disposedBy(bag);

    output.isLoading.stream.debug("isLoading").subscribe().disposedBy(bag);
    output.isRefreshing.stream
        .debug("isRefreshing")
        .subscribe()
        .disposedBy(bag);
    output.isEmpty.stream.debug("isRefreshing").subscribe().disposedBy(bag);
    output.list.stream.debug("list").subscribe().disposedBy(bag);
  }
}

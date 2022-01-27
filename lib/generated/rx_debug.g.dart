// DO NOT EDIT. This is code generated via ptflutter

import 'package:pt_clean_architecture/scenes/login/login_viewmodel.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class RxDebug {
  static bool isEnabled = false;

  static void loginViewModel(
      List<Stream> input, LoginVMO output, DisposeBag bag) {
    if (!isEnabled) return;
    
    input[0].cast().debug("emailTrigger").subscribe().disposedBy(bag);
    input[1].cast().debug("passwordTrigger").subscribe().disposedBy(bag);
    input[2].cast().debug("usernameValidation").subscribe().disposedBy(bag);
    input[3].cast().debug("passwordValidation").subscribe().disposedBy(bag);
    input[4].cast().debug("login").subscribe().disposedBy(bag);

    output.isLoading.stream
        .debug("isLoading")
        .subscribe()
        .disposedBy(bag);
    output.emailValidationMessage.stream
        .debug("emailValidationMessage")
        .subscribe()
        .disposedBy(bag);
    output.passwordValidationMessage.stream
        .debug("passwordValidationMessage")
        .subscribe()
        .disposedBy(bag);
  }
}
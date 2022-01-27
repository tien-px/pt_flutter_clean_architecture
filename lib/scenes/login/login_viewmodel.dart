//ignore_for_file: close_sinks
import 'package:pt_clean_architecture/domain/usecase/dto/login_dto.dart';
import 'package:pt_clean_architecture/generated/rx_debug.g.dart';
import 'package:pt_clean_architecture/scenes/login/login_navigator.dart';
import 'package:pt_clean_architecture/scenes/login/login_usecase.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class LoginVMI {
  final emailTrigger = "".subject;
  final passwordTrigger = "".subject;
  final loginTrigger = subject<void>();
}

class LoginVMO {
  final isLoading = false.obs;
  final emailValidationMessage = "".obs;
  final passwordValidationMessage = "".obs;
}

class LoginViewModel extends RxViewModel<LoginVMI, LoginVMO> {
  LoginNavigatorType navigator;
  LoginSceneUseCaseType useCase;

  LoginViewModel({required this.navigator, required this.useCase});

  @override
  LoginVMO transform(LoginVMI input) {
    super.transform(input);
    final output = LoginVMO();

    final emailTrigger = input.emailTrigger.debounceS(500);
    final passwordTrigger = input.passwordTrigger.debounceS(500);
    final isLoading = false.subject;

    final usernameValidation =
        validation(emailTrigger, useCase.validateEmail, input.loginTrigger);

    final passwordValidation = validation(
        passwordTrigger, useCase.validatePassword, input.loginTrigger);

    final isValid = assignAndCheckIfValid({
          usernameValidation: output.emailValidationMessage,
          passwordValidation: output.passwordValidationMessage
        }, bag);

    isLoading
        .assign(output.isLoading)
        .disposedBy(bag);

    final login = input.loginTrigger
        .doOnData((_) => useCase.hideKeyboard())
        .withLatestFromS(isValid)
        .where((isValid) => isValid)
        .withLatestFrom2S(emailTrigger, passwordTrigger)
        .switchMap((t) => useCase.login(LoginDto(t.i1, t.i2)).trackActivity(isLoading))
        .asBroadcastStream();

    login
        .doOnData((_) => navigator.showLoginAlert())
        .subscribe()
        .disposedBy(bag);

    RxDebug.loginViewModel([
      emailTrigger,
      passwordTrigger,
      usernameValidation,
      passwordValidation,
      login
    ], output, bag);

    return output;
  }
}
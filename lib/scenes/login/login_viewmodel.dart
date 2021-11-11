//ignore_for_file: close_sinks
import 'package:flutter/widgets.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:get/get.dart' as GetX;
import 'package:pt_clean_architecture/generated/rx_debug.g.dart';
import 'package:pt_clean_architecture/generated/tuples.g.dart';
import 'package:pt_clean_architecture/scenes/app/app_viewmodel.dart';
import 'package:pt_clean_architecture/scenes/login/login_navigator.dart';
import 'package:pt_clean_architecture/scenes/login/login_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

class LoginArgs {
  String someText;
  LoginArgs({required this.someText});
}

class LoginVMI {
  var emailTrigger = "".subject;
  var passwordTrigger = "".subject;
  var loginTrigger = subject<void>();
}

class LoginVMO {
  var isLoading = false.obs;
  var emailValidationMessage = "".obs;
  var passwordValidationMessage = "".obs;
}

class LoginViewModel extends RxViewModel<LoginVMI, LoginVMO> {
  LoginNavigatorType navigator;
  LoginSceneUseCaseType useCase;
  LoginArgs? args = GetX.Get.arguments;

  LoginViewModel({required this.navigator, required this.useCase, args});

  @override
  LoginVMO transform(LoginVMI input) {
    super.transform(input);
    var output = LoginVMO();

    var emailTrigger =
        input.emailTrigger.debounceTime(Duration(milliseconds: 500));
    var passwordTrigger =
        input.passwordTrigger.debounceTime(Duration(milliseconds: 500));
    var isLoading = BehaviorSubject.seeded(false);
    var loginTrigger = input.loginTrigger;

    var usernameValidation = Rx.combineLatest2<String, void, String>(
            emailTrigger, loginTrigger, (email, login) => email)
        .map((email) => useCase.validateEmail(email))
        .asBroadcastStream();

    usernameValidation
        .map((validation) => validation.message)
        .drive(output.emailValidationMessage)
        .disposedBy(bag);

    var passwordValidation = Rx.combineLatest2<String, void, String>(
            passwordTrigger, loginTrigger, (password, login) => password)
        .map((password) => useCase.validatePassword(password))
        .asBroadcastStream();

    passwordValidation
        .map((validation) => validation.message)
        .drive(output.passwordValidationMessage)
        .disposedBy(bag);

    var isValid = Rx.combineLatest2<ValidationResult, ValidationResult, bool>(
            usernameValidation, passwordValidation, (a, b) => a.valid & b.valid)
        .startWith(false);

    isLoading.drive(output.isLoading).disposedBy(bag);

    loginTrigger
        .doOnData((event) {
          FocusManager.instance.primaryFocus?.unfocus();
        })
        .withLatestFrom<bool, bool>(isValid, (_, isValid) => isValid)
        .where((isValid) => isValid)
        .withLatestFrom2<String, String, Tuple2EmailPassword>(emailTrigger,
            passwordTrigger, (t, a, b) => Tuple2EmailPassword(a, b))
        .switchMap((tuples) {
          return useCase
              .login(tuples.email, tuples.password)
              .trackActivity(isLoading);
        })
        .doOnData((_) => navigator.showLoginAlert())
        .drive()
        .disposedBy(bag);

    RxDebug.loginViewModel(input, output, bag);

    return output;
  }
}

import 'package:get/get.dart';
import 'package:pt_clean_architecture/scenes/app/app_binding.dart';
import 'package:pt_clean_architecture/scenes/app/app_view.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_binding.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_view.dart';
import 'package:pt_clean_architecture/scenes/login/login_binding.dart';
import 'package:pt_clean_architecture/scenes/login/login_view.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_binding.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_view.dart';

class Routes {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const DEMO_LIST = '/demo_list';
  static const DEMO_LOAD_MORE = '/demo_load_more';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => AppView(), binding: AppBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: Routes.DEMO_LIST,
        page: () => DemoListView(),
        binding: DemoListBinding()),
    GetPage(
        name: Routes.DEMO_LOAD_MORE,
        page: () => DemoLoadMoreView(),
        binding: DemoLoadMoreBinding()),
  ];
}

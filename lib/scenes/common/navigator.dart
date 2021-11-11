import 'package:get/get.dart';
import 'package:pt_clean_architecture/scenes/app/app_pages.dart';

abstract class CommonNavigatorType {
  void toLogin();
  void toDemoList();
  void toLoadMore();
}

class CommonNavigator implements CommonNavigatorType {
  @override
  void toLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  @override
  void toDemoList() {
    Get.toNamed(Routes.DEMO_LIST);
  }

  @override
  void toLoadMore() {
    Get.toNamed(Routes.DEMO_LOAD_MORE);
  }
}

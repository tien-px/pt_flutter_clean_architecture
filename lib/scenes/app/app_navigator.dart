import 'package:flutter/widgets.dart';
import 'package:pt_clean_architecture/scenes/common/navigator.dart';

abstract class AppNavigatorType {
  void toLogin();
  void toDemoList();
  void toLoadMore();
}

class AppNavigator with CommonNavigator implements AppNavigatorType {}

import 'package:pt_clean_architecture/assembler.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

abstract class AppNavigatorType {
  void toLogin();
  void toDemoList();
  void toDemoLoadMore();
}

class AppNavigator implements AppNavigatorType {
  final assembler = Get.find<Assembler>();

  void toLogin() {
    Get.toView(assembler.resolveLoginView());
  }

  @override
  void toDemoList() {
    Get.toView(assembler.resolveDemoListView());
  }

  @override
  void toDemoLoadMore() {
    Get.toView(assembler.resolveDemoLoadMoreView());
  }
}

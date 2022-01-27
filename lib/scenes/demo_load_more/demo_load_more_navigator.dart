import 'package:pt_clean_architecture/assembler.dart';

abstract class DemoLoadMoreNavigatorType {

}

class DemoLoadMoreNavigator implements DemoLoadMoreNavigatorType {
  Assembler assembler;

  DemoLoadMoreNavigator({required this.assembler});
}

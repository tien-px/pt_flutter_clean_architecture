import 'package:pt_clean_architecture/assembler.dart';

abstract class DemoListNavigatorType {
}

class DemoListNavigator implements DemoListNavigatorType {
  Assembler assembler;

  DemoListNavigator({required this.assembler});
}

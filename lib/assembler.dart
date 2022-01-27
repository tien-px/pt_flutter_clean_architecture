export 'package:pt_clean_architecture/scenes/app/app_assembler.dart';
export 'package:pt_clean_architecture/scenes/demo_list/demo_list_assembler.dart';
export 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_assembler.dart';
export 'package:pt_clean_architecture/scenes/login/login_assembler.dart';

class Assembler {
  static const isMockEnabled = bool.fromEnvironment("mock");
}


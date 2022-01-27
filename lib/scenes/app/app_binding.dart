import 'package:pt_clean_architecture/assembler.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class AppBinding {
  static void dependencies() {
    Get.put<Assembler>(Assembler(), permanent: true);
  }
}
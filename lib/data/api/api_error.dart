import 'package:pt_flutter_object_mapper/pt_flutter_object_mapper.dart';

class APIError with Mappable {
  String? resultCode;
  String? message;

  @override
  void mapping(Mapper map) {
    map("resultCode", resultCode, (v) => resultCode = v);
    map("message", message, (v) => message = v);
  }
}

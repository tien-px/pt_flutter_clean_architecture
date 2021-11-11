import 'package:pt_object_mapper/pt_object_mapper.dart';

enum APIErrorType { validationError, unknown }

class APIError with Mappable {
  String? resultCode;
  String? message;

  @override
  void mapping(Mapper map) {
    map("header.resultCode", resultCode, (v) => resultCode = v);
    map("header.message", message, (v) => message = v);
  }

  APIErrorType get type {
    switch (this.resultCode) {
      case "9005":
        return APIErrorType.validationError;
      default:
        return APIErrorType.unknown;
    }
  }
}

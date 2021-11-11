import 'package:dio/dio.dart';
import 'package:pt_architecture/pt_api_service.dart';

class API extends BaseAPIService {
  static final API shared = API._internal();

  factory API() {
    return shared;
  }

  API._internal();

  @override
  void handleResponseError(DioError error) {}

  @override
  BaseAPIInput preprocess(BaseAPIInput input) {
    return input;
  }
}

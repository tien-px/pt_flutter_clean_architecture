import 'package:dio/dio.dart';
import 'package:pt_flutter_architecture/pt_api_service.dart';

class API extends BaseAPIService {
  static final API shared = API._internal();

  factory API() {
    return shared;
  }

  API._internal()
      : super(BaseOptions(
          connectTimeout: 30000,
          sendTimeout: 30000,
          receiveTimeout: 30000,
        ));

  @override
  void handleResponseError(DioError error) {}

  @override
  BaseAPIInput preprocess(BaseAPIInput input) {
    return input;
  }
}

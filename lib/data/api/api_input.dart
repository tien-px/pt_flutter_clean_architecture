import 'package:pt_architecture/pt_api_service.dart';

class APIInput extends BaseAPIInput {
  APIInput(
    String urlString, {
    HttpMethod httpMethod = HttpMethod.get,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? bodyParams,
    bool requireAccessToken = false,
  }) : super(
            headers: headers,
            urlString: urlString,
            httpMethod: httpMethod,
            params: params,
            bodyParams: bodyParams,
            requireAccessToken: requireAccessToken);
}

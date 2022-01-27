import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_flutter_architecture/pt_api_service.dart';
import 'package:pt_flutter_object_mapper/pt_flutter_object_mapper.dart';

import 'api_input.dart';
import 'api_output.dart';
import 'api_services.dart';
import 'api_urls.dart';

class NewsInput extends APIInput {
  NewsInput({required int page})
      : super(APIUrls.news,
      params: {
        "q": "flutter ios",
        "apiKey": "24e0f80624ac4f0ab19ea2d2c8f7f6d2",
        "pageSize": 20,
        "page": page,
      },
      requireAccessToken: false,
      httpMethod: HttpMethod.get);
}

class NewsOutput extends APIOutput {
  List<Article> articles = [];
  int totalResults = 0;

  @override
  void mapping(Mapper map) {
    super.mapping(map);
    map<Article>("articles", articles, (v) => articles = v);
    map("totalResults", totalResults, (v) => totalResults = v);
  }
}

extension NewsAPI on API {
  Stream<NewsOutput> getNews(NewsInput input) {
    return request(input);
  }
}

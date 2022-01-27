import 'package:pt_clean_architecture/data/api/api+news.dart';
import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_clean_architecture/data/api/api_services.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class NewsGateway {
  Stream<PagingInfo<Article>> getNews({required int page}) {
    return API.shared.getNews(NewsInput(page: page)).map((result) =>
        PagingInfo(page, result.articles, page * 20 < result.totalResults));
  }
}

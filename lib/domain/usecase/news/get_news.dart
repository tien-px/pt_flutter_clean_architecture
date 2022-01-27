import 'package:pt_clean_architecture/data/gateways/news_gateway.dart';
import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class GetNews {
  final _gateway = NewsGateway();

  Stream<PagingInfo<Article>> getNews([int page = 1]) {
    return _gateway.getNews(page: page);
  }
}

import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_clean_architecture/domain/usecase/news/get_news.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

abstract class DemoLoadMoreSceneUseCaseType {
  Stream<PagingInfo<Article>> getNews([int page = 1]);
}

class DemoLoadMoreSceneUseCase
    with GetNews
    implements DemoLoadMoreSceneUseCaseType {}

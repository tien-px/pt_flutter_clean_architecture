import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_clean_architecture/domain/usecase/news/get_news.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

abstract class DemoListSceneUseCaseType {
  Stream<PagingInfo<Article>> getNews([int page = 1]);
}

class DemoListSceneUseCase
    with GetNews
    implements DemoListSceneUseCaseType {}

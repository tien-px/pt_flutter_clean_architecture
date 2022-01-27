// DO NOT EDIT. This is code generated via ptflutter

import 'package:pt_flutter_object_mapper/pt_flutter_object_mapper.dart';
import 'package:pt_clean_architecture/data/api/api+news.dart';
import 'package:pt_clean_architecture/data/api/api_error.dart';
import 'package:pt_clean_architecture/data/api/api_output.dart';
import 'package:pt_clean_architecture/domain/entity/article.dart';

class Entities {
  static void register() {
    Mappable.factories[NewsOutput] = () => NewsOutput();
    Mappable.factories[APIError] = () => APIError();
    Mappable.factories[APIOutput] = () => APIOutput();
    Mappable.factories[Article] = () => Article();
  }
}

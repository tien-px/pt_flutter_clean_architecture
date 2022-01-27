import 'package:pt_flutter_object_mapper/pt_flutter_object_mapper.dart';

class Article with Mappable {
  String? title;

  @override
  void mapping(Mapper map) {
    map("title", title, (v) => title = v);
  }

  @override
  String toString() {
    return "Article{title: $title}";
  }
}

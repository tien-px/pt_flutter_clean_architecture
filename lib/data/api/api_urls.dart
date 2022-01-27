import 'package:pt_clean_architecture/scenes/app/app_flavors.dart';

class APIUrls {
  static final endpoint = Flavors.instance.endpoint;
  static String news = "$endpoint/v2/everything";
}

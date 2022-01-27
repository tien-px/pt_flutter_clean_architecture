import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pt_clean_architecture/data/api/api_services.dart';
import 'package:pt_clean_architecture/data/db/shared_prefs.dart';
import 'package:pt_clean_architecture/generated/entities.g.dart';
import 'package:pt_clean_architecture/generated/rx_debug.g.dart';
import 'package:pt_clean_architecture/scenes/app/app_binding.dart';
import 'package:pt_clean_architecture/scenes/app/app_main.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

Future<void> main() async {
  /// Init to load native code
  WidgetsFlutterBinding.ensureInitialized();

  /// Init to load saved locale
  await EasyLocalization.ensureInitialized();

  /// Init singleton of shared preferences
  await sharedPrefs.init();

  if (kDebugMode) {
    /// Enable api debugging
    API.shared.debug = true;

    /// Enable stream debugging
    RxDebug.isEnabled = true;
  }

  /// Set to `null` to disable logging for dispose bag
  DisposeBagConfigs.logger = null;

  /// Init object mapper
  Entities.register();

  /// Insert dependencies
  AppBinding.dependencies();

  /// Run app
  await application();
}

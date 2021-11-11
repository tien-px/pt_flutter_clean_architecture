import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/data/api/api_services.dart';
import 'package:pt_clean_architecture/data/db/shared_prefs.dart';
import 'package:pt_clean_architecture/domain/entity/entities.dart';
import 'package:pt_clean_architecture/flavors.dart';
import 'package:pt_clean_architecture/generated/rx_debug.g.dart';
import 'package:pt_clean_architecture/scenes/app/app_delegate.dart';

Future<void> main() async {
  /// Init Easy Localization
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Easy Localization
  await EasyLocalization.ensureInitialized();

  /// Init Easy Localization
  await BuildConfig.setNativeEnvironment();

  /// Init Easy Localization
  await sharedPrefs.init();
  if (kDebugMode) {
    /// Enable api debugging
    API.shared.debug = true;

    /// Enable stream debugging
    RxDebug.isEnabled = true;
  }

  /// Set to `null` to disable logging for dispose bag
  DisposeBagConfigs.logger = null;

  /// Init Easy Localization
  Entities.register();

  /// Init Easy Localization
  await mainDelegate();
}

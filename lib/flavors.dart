import 'package:flutter/services.dart';

const isMockApp = bool.fromEnvironment("mock");

enum Environment {
  staging,
  production,
}

class BuildConfig {
  static Map<String, dynamic>? _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.staging:
        _config = _Config.stagingConfig;
        break;
      case Environment.production:
        _config = _Config.productionConfig;
        break;
    }
  }

  static Future<void> setNativeEnvironment() async {
    // String? flavor = await MethodChannel('pt_clean_architecture.flavor')
    //     .invokeMethod<String>('getFlavor');
    // print('[LOG][FLAVOR] Set environment: $flavor');
    // switch (flavor) {
    //   case 'staging':
    //     BuildConfig.setEnvironment(Environment.staging);
    //     break;
    //   case 'production':
    //     BuildConfig.setEnvironment(Environment.production);
    //     break;
    //   default:
    //     BuildConfig.setEnvironment(Environment.production);
    //     throw Exception(
    //         "[LOG][FLAVOR] Can't load: $flavor");
    // }
  }

  static get appName {
    return _config?[_Config.keyAppName];
  }

  static get vrDomain {
    return _config?[_Config.keyDomain];
  }
}

class _Config {
  static const keyAppName = 'AppName';
  static const keyDomain = 'AppDomain';

  static Map<String, dynamic> stagingConfig = {
    keyAppName: 'Demo Staging',
    keyDomain: 'https://demo.com.vn',
  };

  static Map<String, dynamic> productionConfig = {
    keyAppName: 'Demo',
    keyDomain: 'https://demo.com.vn',
  };
}

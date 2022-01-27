import 'package:flutter/material.dart';
import 'package:pt_clean_architecture/assembler.dart';
import 'package:pt_clean_architecture/assets/i18n/i18n.dart';
import 'package:pt_clean_architecture/foundation/base.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

import 'app_viewmodel.dart';

Future<void> application() async {
  runApp(EasyLocalization(
      supportedLocales: [
        Locales.VN,
        Locales.EN,
        Locales.JP,
      ],
      path: Constants.i18nPath,
      startLocale: Locales.VN,
      saveLocale: true,
      child: MainApp()));
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late AppVMO output;

  @override
  void initState() {
    super.initState();
  }

  List<GetPage> initPage() =>
      [GetPage(name: "/", page: () => Assembler().resolveAppView())];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: true,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        getPages: initPage(),
      ),
    );
  }
}

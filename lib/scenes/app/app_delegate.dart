import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/assets/resources.dart';
import 'package:pt_clean_architecture/navigation.dart';
import 'package:pt_clean_architecture/scenes/app/app_pages.dart';

import 'app_viewmodel.dart';

Future<void> mainDelegate() async {
  runApp(EasyLocalization(
      supportedLocales: [
        Locales.VN,
        Locales.EN,
        Locales.JP,
      ],
      path: 'lib/assets/translations',
      startLocale: Locales.VN,
      saveLocale: true,
      child: CleanArchitectureApp()));
}

class CleanArchitectureApp extends StatefulWidget {
  CleanArchitectureApp({Key? key}) : super(key: key);
  // final view = GetPage(name: "", page: page);

  @override
  _CleanArchitectureAppState createState() => _CleanArchitectureAppState();
}

class _CleanArchitectureAppState extends State<CleanArchitectureApp>
    with WidgetsBindingObserver, DisposeBagMixin, Bindable {
  late AppVMO output;

  @override
  void bindViewModel() {
    final input = AppVMI();
    // output = widget.view.viewModel.transform(input, bag);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        getPages: AppPages.pages,
        initialRoute: Routes.INITIAL,
      ),
    );
  }
}

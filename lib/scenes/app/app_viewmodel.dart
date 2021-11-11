//ignore_for_file: close_sinks
import 'package:flutter/widgets.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import 'app_navigator.dart';
import 'app_usecase.dart';

enum ListItemScene { login, demoList, demoListloadMore }

class ListItem {
  String title;
  IconData icon;
  ListItemScene scene;

  ListItem(this.title, this.icon, this.scene);
}

class AppVMI {
  var toSceneTrigger = subject<ListItemScene>();
}

class AppVMO {}

class AppViewModel extends RxViewModel<AppVMI, AppVMO> {
  AppNavigatorType navigator;
  AppSceneUseCaseType useCase;

  AppViewModel({required this.navigator, required this.useCase});

  @override
  AppVMO transform(AppVMI input) {
    super.transform(input);
    var output = AppVMO();

    input.toSceneTrigger.subscribe(onData: (scene) {
      switch (scene) {
        case ListItemScene.login:
          navigator.toLogin();
          break;
        case ListItemScene.demoList:
          navigator.toDemoList();
          break;
        case ListItemScene.demoListloadMore:
          navigator.toLoadMore();
          break;
      }
    }).disposedBy(bag);

    return output;
  }
}

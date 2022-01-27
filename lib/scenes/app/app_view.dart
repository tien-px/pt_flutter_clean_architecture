import 'package:flutter/material.dart';
import 'package:pt_clean_architecture/foundation/base.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

import 'app_viewmodel.dart';

class AppView extends RxView<AppViewModel> {
  late final AppVMI input;
  late final AppVMO output;

  AppView({required viewModel}) : super(viewModel: viewModel);

  final items = [
    ListItem('Login', Icons.login, ListItemScene.login),
    ListItem('Demo List', Icons.list, ListItemScene.demoList),
    ListItem('Demo List With Load More', Icons.list_alt,
        ListItemScene.demoListLoadMore)
  ];

  @override
  void bindViewModel() {
    input = AppVMI();
    output = viewModel.transform(input);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.home_dashboard),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                shadowColor: Colors.black,
                elevation: 3,
                child: InkWell(
                  onTap: () => input.toSceneTrigger.emit(item.scene),
                  child: ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title).defaultStyle(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

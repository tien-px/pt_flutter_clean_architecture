import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/scenes/login/login_binding.dart';
import 'package:pt_clean_architecture/scenes/login/login_view.dart';

import 'app_viewmodel.dart';

class AppView extends RxView<AppViewModel> {
  late AppVMI input;
  late AppVMO output;

  final items = [
    ListItem('Login', Icons.login, ListItemScene.login),
    ListItem('Demo List', Icons.list, ListItemScene.demoList),
    ListItem('Demo List With Load More', Icons.list_alt,
        ListItemScene.demoListloadMore)
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
        title: Text('Dashboard'),
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
                    title: Text(item.title),
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

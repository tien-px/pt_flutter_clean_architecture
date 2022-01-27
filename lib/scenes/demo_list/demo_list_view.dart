import 'package:flutter/material.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_viewmodel.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class DemoListView extends RxView<DemoListViewModel> {
  late final DemoListVMI input;
  late final DemoListVMO output;

  DemoListView({required viewModel}) : super(viewModel: viewModel);

  @override
  void bindViewModel() {
    input = DemoListVMI();
    output = viewModel.transform(input);
    input.loadTrigger.emit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo List'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GetTableView(
          onRefresh: () => input.reloadTrigger.emit(),
          isLoading: output.isLoading,
          isRefreshing: output.isRefreshing,
          isEmpty: output.isEmpty,
          child: Obx(() {
            var demoList = output.list;
            return ListView.separated(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: demoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(demoList[index].title ?? ""),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 2,);
              },
            );
          }),
        ),
      ),
    );
  }
}

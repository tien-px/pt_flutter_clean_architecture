import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_clean_architecture/scenes/app/app_pages.dart';
import 'package:pt_clean_architecture/scenes/demo_list/get_table_view.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class DemoLoadMoreView extends RxView<DemoLoadMoreViewModel> {
  late DemoLoadMoreVMI input;
  late DemoLoadMoreVMO output;

  @override
  void bindViewModel() {
    input = DemoLoadMoreVMI();
    output = viewModel.transform(input);
    input.loadTrigger.emit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Load More'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GetTableView(
          onRefresh: () => input.reloadTrigger.emit(),
          onLoadMore: () => input.loadMoreTrigger.emit(),
          isLoading: output.isLoading,
          isRefreshing: output.isRefreshing,
          isLoadingMore: output.isLoadingMore,
          child: Obx(() {
            var demoList = output.list.value;
            return ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: demoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(demoList[index].name),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

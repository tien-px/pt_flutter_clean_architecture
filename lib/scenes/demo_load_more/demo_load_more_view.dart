import 'package:flutter/material.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_viewmodel.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class DemoLoadMoreView extends RxView<DemoLoadMoreViewModel> {
  late final DemoLoadMoreVMI input;
  late final DemoLoadMoreVMO output;

  DemoLoadMoreView({required viewModel}) : super(viewModel: viewModel);

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

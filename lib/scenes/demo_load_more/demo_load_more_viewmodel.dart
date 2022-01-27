//ignore_for_file: close_sinks
import 'package:get/get.dart' as GetX;
import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_navigator.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_usecase.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class DemoLoadMoreVMI {
  var loadTrigger = subject<void>();
  var reloadTrigger = subject<void>();
  var loadMoreTrigger = subject<void>();
}

class DemoLoadMoreVMO {
  var list = <Article>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var isLoadingMore = false.obs;
}

class DemoLoadMoreViewModel
    extends RxViewModel<DemoLoadMoreVMI, DemoLoadMoreVMO> {
  DemoLoadMoreNavigatorType navigator;
  DemoLoadMoreSceneUseCaseType useCase;

  DemoLoadMoreViewModel({required this.navigator, required this.useCase});

  @override
  DemoLoadMoreVMO transform(DemoLoadMoreVMI input) {
    super.transform(input);
    var output = DemoLoadMoreVMO();

    var result = getPage<Article>(GetPageInput(
        loadTrigger: input.loadTrigger,
        reloadTrigger: input.reloadTrigger,
        loadMoreTrigger: input.loadMoreTrigger,
        getItems: useCase.getNews,
        loadMoreItems: (page) => useCase.getNews(page)));

    result.item.map((s) => s.items).assign(output.list).disposedBy(bag);
    result.isLoading.assign(output.isLoading).disposedBy(bag);
    result.isEmpty.assign().disposedBy(bag);
    result.isLoadingMore.assign(output.isLoadingMore).disposedBy(bag);
    result.isRefreshing.assign(output.isRefreshing).disposedBy(bag);
    result.fetch.assign().disposedBy(bag);

    // RxDebug.demoListViewModel(input, output);

    return output;
  }
}

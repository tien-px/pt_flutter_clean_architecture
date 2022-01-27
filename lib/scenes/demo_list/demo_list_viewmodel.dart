//ignore_for_file: close_sinks
import 'package:pt_clean_architecture/domain/entity/article.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_navigator.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_usecase.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class DemoListVMI {
  var loadTrigger = subject<void>();
  var reloadTrigger = subject<void>();
}

class DemoListVMO {
  var list = <Article>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var isEmpty = false.obs;
}

class DemoListViewModel extends RxViewModel<DemoListVMI, DemoListVMO> {
  DemoListNavigatorType navigator;
  DemoListSceneUseCaseType useCase;

  DemoListViewModel({required this.navigator, required this.useCase, args});

  @override
  DemoListVMO transform(DemoListVMI input) {
    super.transform(input);
    var output = DemoListVMO();

    var result = getList<Article>(GetListInput(
        loadTrigger: input.loadTrigger,
        reloadTrigger: input.reloadTrigger,
        getItems: () => useCase.getNews().map((s) => s.items)));

    result.list.assign(output.list).disposedBy(bag);
    result.isLoading.assign(output.isLoading).disposedBy(bag);
    result.isEmpty.assign(output.isEmpty).disposedBy(bag);
    result.isRefreshing.assign(output.isRefreshing).disposedBy(bag);
    result.fetch.subscribe().disposedBy(bag);

    return output;
  }
}

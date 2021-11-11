//ignore_for_file: close_sinks
import 'package:pt_architecture/pt_architecture.dart';
import 'package:get/get.dart' as GetX;
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_clean_architecture/generated/rx_debug.g.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_navigator.dart';
import 'package:pt_clean_architecture/scenes/demo_load_more/demo_load_more_usecase.dart';
import 'package:tuple/tuple.dart';
import 'package:rxdart/rxdart.dart';

class DemoLoadMoreVMI {
  var loadTrigger = subject<void>();
  var reloadTrigger = subject<void>();
  var loadMoreTrigger = subject<void>();
}

class DemoLoadMoreVMO {
  var list = <Passenger>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var isLoadingMore = false.obs;
}

class DemoLoadMoreViewModel
    extends RxViewModel<DemoLoadMoreVMI, DemoLoadMoreVMO> {
  DemoLoadMoreNavigatorType navigator;
  DemoLoadMoreSceneUseCaseType useCase;

  DemoLoadMoreViewModel({required this.navigator, required this.useCase, args});

  @override
  DemoLoadMoreVMO transform(DemoLoadMoreVMI input) {
    super.transform(input);
    var output = DemoLoadMoreVMO();

    var result = getPage<Passenger>(GetPageInput(
        loadTrigger: input.loadTrigger,
        reloadTrigger: input.reloadTrigger,
        loadMoreTrigger: input.loadMoreTrigger,
        getItems: useCase.getPassenger,
        loadMoreItems: (page) => useCase.getPassenger(page)));

    result.item.map((event) => event.items).drive(output.list).disposedBy(bag);

    result.isLoading.drive(output.isLoading).disposedBy(bag);
    result.isEmpty.drive().disposedBy(bag);
    result.isLoadingMore.drive(output.isLoadingMore).disposedBy(bag);
    result.isRefreshing.drive(output.isRefreshing).disposedBy(bag);
    result.fetch.drive().disposedBy(bag);

    // RxDebug.demoListViewModel(input, output);

    return output;
  }
}

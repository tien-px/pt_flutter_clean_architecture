//ignore_for_file: close_sinks
import 'package:pt_architecture/pt_architecture.dart';
import 'package:get/get.dart' as GetX;
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_clean_architecture/generated/rx_debug.g.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_navigator.dart';
import 'package:pt_clean_architecture/scenes/demo_list/demo_list_usecase.dart';
import 'package:tuple/tuple.dart';
import 'package:rxdart/rxdart.dart';

class DemoListVMI {
  var loadTrigger = subject<void>();
  var reloadTrigger = subject<void>();
}

class DemoListVMO {
  var list = <Passenger>[].obs;
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

    var result = getList<Passenger>(GetListInput(
        loadTrigger: input.loadTrigger,
        reloadTrigger: input.reloadTrigger,
        getItems: () => useCase.getPassenger().map((event) => event.items)));

    result.list.drive(output.list).disposedBy(bag);

    result.isLoading.drive(output.isLoading).disposedBy(bag);
    result.isEmpty.drive(output.isEmpty).disposedBy(bag);
    result.isRefreshing.drive(output.isRefreshing).disposedBy(bag);
    result.fetch.drive().disposedBy(bag);

    RxDebug.demoListViewModel(input, output, bag);

    return output;
  }
}

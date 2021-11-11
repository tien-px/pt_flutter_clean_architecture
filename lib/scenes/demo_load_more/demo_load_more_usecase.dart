import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_clean_architecture/domain/usecase/passenger/passenger_usecase.dart';

abstract class DemoLoadMoreSceneUseCaseType {
  Stream<PagingInfo<Passenger>> getPassenger([int page]);
}

class DemoLoadMoreSceneUseCase
    with PassengerUseCase
    implements DemoLoadMoreSceneUseCaseType {}

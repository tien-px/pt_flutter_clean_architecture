import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/data/repo/passenger_repository.dart';
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:rxdart/rxdart.dart';

abstract class PassengerUseCaseType {
  Stream<PagingInfo<Passenger>> getPassenger([int page]);
}

class PassengerUseCase implements PassengerUseCaseType {
  final _repository = PassengerRepository();

  @override
  Stream<PagingInfo<Passenger>> getPassenger([int page = 0]) {
    return _repository
        .getPassenger(page: page, size: 20)
        .delay(Duration(seconds: 2));
  }
}

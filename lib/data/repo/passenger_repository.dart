import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_clean_architecture/data/api/api+passenger.dart';

import '../api/api_services.dart';

abstract class PassengerRepositoryType {
  Stream<PagingInfo<Passenger>> getPassenger(
      {required int page, required int size});
}

class PassengerRepository implements PassengerRepositoryType {
  Stream<PagingInfo<Passenger>> getPassenger(
      {required int page, required int size}) {
    return API.shared.getPassenger(PassengerInput(page: page, size: size)).map(
        (result) => PagingInfo(page, result.data, page <= result.totalPages));
  }
}

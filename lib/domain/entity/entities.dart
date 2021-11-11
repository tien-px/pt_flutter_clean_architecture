import 'package:pt_clean_architecture/data/api/api+passenger.dart';
import 'package:pt_clean_architecture/data/api/api_error.dart';
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_object_mapper/pt_object_mapper.dart';

class Entities {
  static void register() {
    Mappable.factories[APIError] = () => APIError();
    Mappable.factories[PassengerOutput] = () => PassengerOutput();
    Mappable.factories[Passenger] = () => Passenger();
  }
}

import 'package:pt_architecture/pt_api_service.dart';
import 'package:pt_architecture/pt_architecture.dart';
import 'package:pt_clean_architecture/domain/entity/passenger.dart';
import 'package:pt_object_mapper/pt_object_mapper.dart';

import 'api_input.dart';
import 'api_output.dart';
import 'api_services.dart';
import 'api_urls.dart';

class PassengerInput extends APIInput {
  PassengerInput({required int page, required int size})
      : super(APIUrls.passenger,
            params: {
              "page": page,
              "size": size,
            },
            requireAccessToken: false,
            httpMethod: HttpMethod.get);
}

class PassengerOutput extends APIOutput {
  List<Passenger> data = [];
  int totalPages = 0;

  @override
  void mapping(Mapper map) {
    super.mapping(map);
    map<Passenger>("data", data, (v) => data = v);
    map("totalPages", totalPages, (v) => totalPages = v);
  }
}

extension PassengerAPI on API {
  Stream<PassengerOutput> getPassenger(PassengerInput input) {
    return request(input);
  }
}

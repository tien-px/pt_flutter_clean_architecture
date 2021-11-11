import 'package:pt_object_mapper/pt_object_mapper.dart';

class Passenger with Mappable {
  String name = "";

  @override
  void mapping(Mapper map) {
    map("name", name, (v) => name = v);
  }

  @override
  String toString() {
    return "Passenger{id: $name}";
  }
}

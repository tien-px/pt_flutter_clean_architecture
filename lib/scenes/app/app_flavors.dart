import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';

enum Flavor { development, staging, production }

@immutable
class Flavors {
  static late final Flavors instance = Flavors.current();

  final String endpoint;

  const Flavors._({
    required this.endpoint
  });

  factory Flavors._dev() {
    return const Flavors._(
      endpoint: 'https://newsapi.org'
    );
  }

  factory Flavors._staging() {
    return const Flavors._(
      endpoint: 'https://newsapi.org'
    );
  }

  factory Flavors._production() {
    return const Flavors._(
      endpoint: 'https://newsapi.org'
    );
  }

  factory Flavors.current() {
    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('flavor'),
    );

    switch (flavor) {
      case Flavor.development:
        return Flavors._dev();
      case Flavor.staging:
        return Flavors._staging();
      case Flavor.production:
        return Flavors._production();
      default:
        return Flavors._dev();
    }
  }
}
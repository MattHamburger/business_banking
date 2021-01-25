import 'package:clean_framework/clean_framework.dart';

/// Made up of classes that represent the data in the BankLOcator Repository
class BankLocatorEntity extends Entity {
  final double latitude;
  final double longitude;

  BankLocatorEntity({
    double latitude,
    double longitude,
    List<EntityFailure> errors = const [],
  })  : latitude = latitude ?? 0.0,
        longitude = longitude ?? 0.0,
        super(errors: errors);

  @override
  List<Object> get props => [latitude, longitude, errors];

  @override
  merge({errors, double latitude, double longitude}) => BankLocatorEntity(
      errors: errors,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude);
}

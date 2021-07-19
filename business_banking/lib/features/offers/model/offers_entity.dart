import 'package:clean_framework/clean_framework.dart';

class OffersEntity extends Entity {
  final List<String> offers;

  OffersEntity({
    List<EntityFailure> errors = const [],
    List<String>? offers,
  })  : offers = offers ?? <String>[],
        super(errors: errors);

  OffersEntity merge({
    List<EntityFailure>? errors,
    List<String>? offers,
  }) {
    return OffersEntity(
      errors: errors ?? this.errors,
      offers: offers ?? this.offers,
    );
  }
}

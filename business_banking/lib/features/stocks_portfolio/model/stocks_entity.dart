import 'package:clean_framework/clean_framework.dart';

class StocksEntity extends Entity {
  final List<Map<String, dynamic>> stocks;

  StocksEntity(
      {List<EntityFailure> errors = const [],
      List<Map<String, dynamic>>? stocks})
      : this.stocks = stocks ?? [];

  @override
  List<Object> get props => [errors, stocks];

  @override
  StocksEntity merge({errors, List<Map<String, dynamic>>? stocks}) {
    return StocksEntity(
      errors: errors ?? this.errors,
      stocks: stocks ?? this.stocks,
    );
  }
}
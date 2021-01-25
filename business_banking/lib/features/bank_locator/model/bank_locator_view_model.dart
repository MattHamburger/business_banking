import 'package:clean_framework/clean_framework.dart';

class BankLocatorViewModel extends ViewModel {
  final List bankLocations;
  final double latitude;
  final double longitude;

  BankLocatorViewModel({this.latitude, this.longitude, this.bankLocations})
      : assert(bankLocations != null);

  @override
  List<Object> get props => bankLocations;
}

import 'package:clean_framework/clean_framework.dart';

enum ServiceStatus { success, fail, unknown }
enum DataStatus { valid, invalid, unknown }

class BillPayViewModel extends ViewModel {
  final double amount;
  final serviceStatus;
  final dataStatus;

  BillPayViewModel(
      {this.amount,
      this.serviceStatus = ServiceStatus.unknown,
      this.dataStatus = DataStatus.unknown})
      : assert(amount != null);
}

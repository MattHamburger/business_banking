import 'package:clean_framework/clean_framework.dart';

class CashbackViewModel extends ViewModel {
  final num balance;
  final bool busy;

  CashbackViewModel({required this.balance, this.busy = false});

  List<Object?> get props => [balance,busy];
}

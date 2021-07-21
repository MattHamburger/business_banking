import 'package:clean_framework/clean_framework.dart';

class FixedDepositRequestViewModel extends ViewModel {
  final bool isBusy;

  FixedDepositRequestViewModel({this.isBusy = false});

  @override
  List<Object?> get props => [isBusy];
}

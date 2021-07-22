import 'package:clean_framework/clean_framework.dart';

class FixedDepositRequestViewModel extends ViewModel {
  final bool isBusy;
  final bool isValidData;

  FixedDepositRequestViewModel({this.isBusy = false, this.isValidData = false});

  @override
  List<Object?> get props => [isBusy, isValidData];
}

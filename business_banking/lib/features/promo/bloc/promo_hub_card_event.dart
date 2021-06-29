import 'package:equatable/equatable.dart';

abstract class PromoHubCardEvent extends Equatable {}

class UpdateIncomeEvent extends PromoHubCardEvent {
  final String income;

  UpdateIncomeEvent(this.income);

  @override
  List<Object> get props => [income];

  @override
  bool get stringify => true;
}

class UpdatePhoneEvent extends PromoHubCardEvent {
  final String phone;

  UpdatePhoneEvent(this.phone);

  @override
  List<Object> get props => [phone];
  @override
  bool get stringify => true;
}

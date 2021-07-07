import 'package:equatable/equatable.dart';

abstract class PromoHubCardEvent extends Equatable {}

class UpdateFormEvent extends PromoHubCardEvent {

  final String phone;
  final String income;

  UpdateFormEvent(this.income, this.phone);

  @override
  List<Object> get props => [income, phone];
  bool get stringify => true;
}

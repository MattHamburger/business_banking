import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoHubCardViewModel extends ViewModel {
  final String income;
  final String incomeFieldStatus;
  final String phone;
  final String phoneFieldStatus;
  final String icon;
  final serviceResponseStatus;

  PromoHubCardViewModel(
      {required this.income,
        required this.incomeFieldStatus,
        required this.phone,
        required this.phoneFieldStatus,
        required this.icon,
        this.serviceResponseStatus = PromoServiceResponseStatus.unknown
      });

  @override
  List<Object> get props => [income, phone, icon];
}

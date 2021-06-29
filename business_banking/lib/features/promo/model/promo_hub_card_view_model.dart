import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoHubCardViewModel extends ViewModel {
  final String income;
  final String incomeStatus;
  final String phone;
  final String phoneStatus;
  final String icon;
  final serviceResponseStatus;

  PromoHubCardViewModel(
      {required this.income,
        required this.incomeStatus,
        required this.phone,
        required this.phoneStatus,
        required this.icon,
        this.serviceResponseStatus = PromoServiceResponseStatus.unknown
      });

  @override
  List<Object> get props => [income, phone, icon];
}

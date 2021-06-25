import 'package:clean_framework/clean_framework.dart';

class PromoHubCardViewModel extends ViewModel {
  final String income;
  final String phone;
  final String icon;

  PromoHubCardViewModel(
      {required this.income,
        required this.phone,
        required this.icon,
      });

  @override
  List<Object> get props => [income, phone, icon];
}

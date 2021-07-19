import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';

class OffersViewModel extends ViewModel {
  final List<String> offers;
  final ServiceResponseStatus serviceResponseStatus;

  OffersViewModel({
    required this.offers,
    this.serviceResponseStatus = ServiceResponseStatus.unknown,
  });

  @override
  List<Object?> get props => [offers, serviceResponseStatus];
}

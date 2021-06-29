import 'package:business_banking/features/promo/bloc/promo_hub_card_service_adapter.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_entity.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class PromoHubCardUseCase extends UseCase {
  ViewModelCallback<PromoHubCardViewModel> _viewModelCallback;
  RepositoryScope? _scope;

  PromoHubCardUseCase(ViewModelCallback<PromoHubCardViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  String validateIncomeFieldInput(String income){
    final regex = RegExp(r"^[5-8]*$");
    final match = regex.allMatches(income).first;
    bool isValidMatch = false;

    if (match.start == 0 && match.end == income.length) {
      isValidMatch = true;
    }

    if (income.isNotEmpty && isValidMatch) {
      return '';
    } else {
      return "Please provide yearly income.";
    }
  }

  void validatePhoneFieldInput(String phone){
    //TODO: implement
    throw UnimplementedError();
  }

  Future<void> execute() async {
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<PromoHubCardEntity>(PromoHubCardEntity(), _notifySubscribers);
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, PromoHubCardServiceAdapter());
    PromoHubCardEntity entity = ExampleLocator().repository.get<PromoHubCardEntity>(_scope!);
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  PromoHubCardViewModel buildViewModel(PromoHubCardEntity promoEntity) {
    return PromoHubCardViewModel(
      icon: promoEntity.icon, phone: promoEntity.phone, income: promoEntity.income,
    );
  }
}

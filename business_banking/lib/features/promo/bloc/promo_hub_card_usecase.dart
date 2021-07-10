import 'package:business_banking/features/promo/bloc/promo_hub_card_service_adapter.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_entity.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class PromoHubCardUseCase extends UseCase {
  ViewModelCallback<ViewModel> _viewModelCallback;
  late RepositoryScope _scope;

  PromoHubCardUseCase(ViewModelCallback<ViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  Future<void> execute() async {
    _scope = ExampleLocator()
        .repository
        .create<PromoEntity>(PromoEntity(), _notifySubscribers);

    PromoEntity promoEntity = ExampleLocator().repository.get(_scope);
    _notifySubscribers(promoEntity);
  }

  void submit() async {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, PromoHubCardServiceAdapter());
      PromoEntity entity = ExampleLocator()
      .repository.get<PromoEntity>(_scope);
      _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel());
  }

  PromoHubCardViewModel buildViewModel({
    PromoEntity? entity,
    incomeState: '',
    phoneState: '',
  }) {
    entity = entity ?? ExampleLocator().repository.get(_scope);
    if (entity.hasErrors()) {
      return PromoHubCardViewModel(
        promotions: entity.promotions,
          icon: entity.icon,
          income: entity.income,
          incomeFieldStatus:
              incomeState,
          phone: entity.phone,
          phoneFieldStatus:
              phoneState,
          serviceResponseStatus: PromoServiceResponseStatus.failed);
    } else {
      return PromoHubCardViewModel(
          promotions: entity.promotions,
          icon: entity.icon,
          income: entity.income,
          incomeFieldStatus:
          incomeState,
          phone: entity.phone,
          phoneFieldStatus:
          phoneState,
          serviceResponseStatus: PromoServiceResponseStatus.succeed);
    }
  }

  updateInput(
      String income,
      String phone) {
    Map<String,String> validationMessages = validateForm(income, phone);
    PromoEntity entity =
        ExampleLocator()
            .repository
            .get<PromoEntity>(_scope);
    final updatedEntity = entity.merge(income: income, phone: phone);

    ExampleLocator()
      .repository
      .update(_scope, updatedEntity as PromoEntity);

    entity = ExampleLocator().repository.get<PromoEntity>(_scope);
    _viewModelCallback(
        buildViewModel(entity: entity, incomeState: validationMessages['income'],
    phoneState: validationMessages['phone']));
  }

  Map<String, String> validateForm(String income, String phone) {
    Map <String, String>validationMessages = {
      'income' : validateIncome(income) ? '' : 'Enter correct numbers',
      'phone' : validatePhone(phone) ? '' : 'Enter correct phone number'
    };
    return validationMessages;
  }

  bool validateIncome(String income) {
    final regexIncome = RegExp(r"^[0-3]*$");
    return income.isNotEmpty && income.contains(regexIncome);
  }

  bool validatePhone (String phone){
    final regexPhone = RegExp(r"^[0-3]*$");
    return phone.isNotEmpty && phone.contains(regexPhone);
  }
}

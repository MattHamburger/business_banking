import 'package:business_banking/features/promo/bloc/promo_hub_card_service_adapter.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_entity.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class PromoHubCardUseCase extends UseCase {
  ViewModelCallback<PromoHubCardViewModel> _viewModelCallback;
  late RepositoryScope _scope;

  PromoHubCardUseCase(ViewModelCallback<PromoHubCardViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  Future<void> execute() async {
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<PromoHubCardEntity>(PromoHubCardEntity(), _notifySubscribers);
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, PromoHubCardServiceAdapter());
    PromoHubCardEntity entity = ExampleLocator().repository.get<PromoHubCardEntity>(_scope);
    _notifySubscribers(entity);
  }

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

  String validatePhoneFieldInput(String phone){
    final regex = RegExp(r"^[1-3]*$");
    final match = regex.allMatches(phone).first;
    bool isValidMatch = false;

    if (match.start == 0 && match.end == phone.length) {
      isValidMatch = true;
    }

    if (phone.isNotEmpty && isValidMatch) {
      return '';
    } else {
      return "Please provide yearly income.";
    }
  }

  updateIncome(String income) {
    final PromoHubCardEntity entity = ExampleLocator()
        .repository
        .get<PromoHubCardEntity>(_scope);
    final updatedEntity = entity.merge(income: income);
    ExampleLocator().repository.update<PromoHubCardEntity>(_scope, updatedEntity
    as PromoHubCardEntity);
    String validationStatus = validateIncomeFieldInput(income);
    if (validationStatus.isNotEmpty) {
      _viewModelCallback(buildViewModel(
        formState: validationStatus,
          inputField: PromoInputField.income));
    } else {
      _viewModelCallback(buildViewModel());
    }
  }

  updatePhone(String phone) {
    final PromoHubCardEntity entity = ExampleLocator()
        .repository
        .get<PromoHubCardEntity>(_scope);
    final updatedEntity = entity.merge(phone: phone);
    ExampleLocator().repository.update<PromoHubCardEntity>(_scope, updatedEntity
    as PromoHubCardEntity);
    String validationStatus = validatePhoneFieldInput(phone);
    if (validationStatus.isNotEmpty) {
      _viewModelCallback(buildViewModel(
          formState: validationStatus,
          inputField: PromoInputField.phone));
    } else {
      _viewModelCallback(buildViewModel());
    }

  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel());
  }

  PromoHubCardViewModel buildViewModel(
      {PromoHubCardEntity? entity,
    inputField = PromoInputField.unknown,
    formState: '',
  }) {
    if (entity!.hasErrors()) {
    return PromoHubCardViewModel(
      icon: entity.icon,
      income: entity.income,
      incomeStatus: inputField == PromoInputField.income ?
      formState : '',
      phone: entity.phone,
      phoneStatus: inputField == PromoInputField.phone ?
      formState : '',
      serviceResponseStatus: PromoServiceResponseStatus.failed
    );
  } else {
      return PromoHubCardViewModel(
          icon: entity.icon,
          income: entity.income,
          incomeStatus: inputField == PromoInputField.income ?
          formState : '',
          phone: entity.phone,
          phoneStatus: inputField == PromoInputField.phone ?
          formState : '',
          serviceResponseStatus: PromoServiceResponseStatus.succeed
      );
    }
  }
}

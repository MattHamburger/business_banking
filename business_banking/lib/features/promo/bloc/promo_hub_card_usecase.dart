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

    PromoEntity promoEntity = ExampleLocator()
    .repository.get(_scope);

    _notifySubscribers(promoEntity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel());
  }

  PromoHubCardViewModel buildViewModel({
    PromoEntity? entity,
    inputField = PromoInputField.unknown,
    formState: '',
  }) {
    entity = entity ??
        ExampleLocator().repository.get(_scope);
    if (entity.hasErrors()) {
      return PromoHubCardViewModel(
          icon: 'hbc',//entity.icon,
          income: '00',//entity.income,
          incomeFieldStatus:
          inputField == PromoInputField.income ? formState : '',
          phone:'99',// entity.phone,
          phoneFieldStatus:
          inputField == PromoInputField.phone ? formState : '',
          serviceResponseStatus: PromoServiceResponseStatus.failed);
    } else {
      return PromoHubCardViewModel(
          icon: 'kkk',//entity.icon,
          income:'90',// entity.income,
          incomeFieldStatus:
          inputField == PromoInputField.income ? formState : '',
          phone: '789', //entity.phone,
          phoneFieldStatus:
          inputField == PromoInputField.phone ? formState : '',
          serviceResponseStatus: PromoServiceResponseStatus.succeed);
    }
  }

  updateIncome(String income) {
    final PromoEntity entity =
    ExampleLocator().repository.get<PromoEntity>(_scope);
    final updatedEntity = entity.merge(income: income);
    ExampleLocator()
        .repository
        .update<PromoEntity>(_scope, updatedEntity as PromoEntity);
    String validationStatus = validateIncomeFieldInput(income);
    if (validationStatus.isNotEmpty) {
      _viewModelCallback(buildViewModel(
          formState: validationStatus, inputField: PromoInputField.income));
    } else {
      _viewModelCallback(buildViewModel());
    }
  }

  String validateIncomeFieldInput(String income) {
    final regex = RegExp(r"^[1-9]*$");
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

  String validatePhoneFieldInput(String phone) {
    final regex = RegExp(r"^[1-3]*$");
    final match = regex.allMatches(phone).first;
    bool isValidMatch = false;

    if (match.start == 0 && match.end == phone.length) {
      isValidMatch = true;
    }

    if (phone.isNotEmpty && isValidMatch) {
      return '';
    } else {
      return "Please provide phone number.";
    }
  }

  updatePhone(String phone) {
    final PromoEntity entity =
        ExampleLocator().repository.get<PromoEntity>(_scope);
    final updatedEntity = entity.merge(phone: phone);
    ExampleLocator()
        .repository
        .update<PromoEntity>(_scope, updatedEntity as PromoEntity);
    String validationStatus = validatePhoneFieldInput(phone);
    if (validationStatus.isNotEmpty) {
      _viewModelCallback(buildViewModel(
          formState: validationStatus, inputField: PromoInputField.phone));
    } else {
      _viewModelCallback(buildViewModel());
    }
  }
}

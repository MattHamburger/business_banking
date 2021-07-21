import 'package:business_banking/features/contact_pay/bloc/form/contact_pay_form_usecase.dart';
import 'package:business_banking/features/contact_pay/model/form/contact_pay_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ContactPayFormUseCase useCase;

  ContactPayFormViewModel contactPayViewModel;

  setUp(() {
    useCase = ContactPayFormUseCase((viewModel) {
      contactPayViewModel = viewModel;
      return true;
    });
  });

  group("ContactPayFormUseCase tests", () {
    test('ContactPayFormUseCase test ViewModel should not be null', () async {
      await useCase.execute();

      expect(contactPayViewModel, isNotNull);
    });
  });
}

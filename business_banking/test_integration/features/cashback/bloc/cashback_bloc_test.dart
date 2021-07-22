import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('CashbackBloc onFormSubmitEvent', () async {
    final bloc = CashbackBloc();

    final tester = ViewModelPipeTester.forPipe(bloc.cashbackFormViewModelPipe);

    await tester.whenBeingListenedTo().thenExpectA(
        CashbackFormViewModel('', '', CashbackOption.frequentMiles));

    await tester
        .whenDoing(() => bloc.onCityChangePipe.send('New York'))
        .thenExpectA(CashbackFormViewModel(
            'New York', '', CashbackOption.frequentMiles));

    await tester.whenDoing(() => bloc.onFormSubmitEvent.launch()).thenExpectA(
        CashbackConfirmationViewModel(
            'New York', '', CashbackOption.frequentMiles, '12345'));
  });
}

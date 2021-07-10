// @dart=2.9

import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_usecase.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUseCase extends Mock implements PromoHubCardUseCase {

}

void main() {
  PromoBloc bloc;
  MockUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockUseCase();
    bloc = PromoBloc(useCase: mockUseCase);
  });

  tearDown((){
    bloc.dispose();
    expect(bloc.promoHubCardViewModelPipe.receive, emitsDone);
    expect(bloc.promoHubCardEventsPipe.receive, emitsDone);
  });

  group('PromoBloc tests',(){
    String income = '100';
    String phone = '3103103030';
    PromoHubCardEvent updateFormEvent = UpdateFormEvent(income, phone);

    PromoHubCardViewModel promoViewModel =
    PromoHubCardViewModel(
        phoneFieldStatus: '',
        income: '100',
        icon: '',
        incomeFieldStatus: '',
        phone: '3103103030',
      serviceResponseStatus: PromoServiceResponseStatus.succeed,
      promotions: [],
    );

    test('promoViewModelPipe recieves viewModel',(){
      bloc.promoHubCardViewModelPipe.send(promoViewModel);
      bloc.promoHubCardViewModelPipe.receive.listen((model) {
        verify(mockUseCase.execute()).called(1);
      });
    });

    test('PromoBloc onSubmitForm calls usecase',(){
      bloc.onSubmitForm();
      verify(mockUseCase.submit()).called(1);
    });

    test('PromoBloc validateForm calls usecase',(){
      bloc.validateForm(income, phone);
      verify(mockUseCase.validateForm(income, phone)).called(1);
    });

    test('verify handler is called on receipt of event',(){
      bloc.promoHubCardEventsPipe.receive.listen((event) {
        if (event is UpdateFormEvent) {
          verify(mockUseCase
          .updateInput(income, phone))
              .called(1);
        }
      });
      bloc.handlePromoHubCardEvent(updateFormEvent);
    });

    test('verify phone number after sending UpdateFormEvent func',
            () async {
          bloc.promoHubCardViewModelPipe.receive.listen((event) {
            expect(event.phone, phone);
            expect(event.income, income);
          });
          bloc.promoHubCardEventsPipe.send(
              UpdateFormEvent('100', '3103103311')
          );
    });
  });

}

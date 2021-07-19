// @dart=2.9
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/offers/bloc/offers_usecase.dart';
import 'package:business_banking/features/offers/model/offers_entity.dart';
import 'package:business_banking/features/offers/model/offers_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OffersUseCase', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        final useCase = OffersUseCase((ViewModel _) => true);
        expect(useCase, isA<OffersUseCase>());
        expect(useCase.viewModelCallBack, isNotNull);
      });
    });

    group('execute()', () {
      test('should generate an OffersViewModel', () async {
        Object viewModel;
        final useCase = OffersUseCase((ViewModel model) {
          viewModel = model;
          return true;
        });

        await useCase.execute();
        expect(viewModel, isA<OffersViewModel>());
      });
    });

    group('_buildViewModel()', () {
      test('should generate an OffersViewModel', () async {
        final useCase = OffersUseCase((ViewModel _) => true);

        final offersEntityWithErrors = OffersEntity(
          errors: <EntityFailure>[GeneralEntityFailure()],
          offers: <String>['Offer #1', 'Offer #2'],
        );
        var viewModel = useCase.buildViewModel(offersEntityWithErrors);
        expect(viewModel, isA<OffersViewModel>());
        expect(viewModel.serviceResponseStatus, ServiceResponseStatus.failed);
        expect(viewModel.offers, offersEntityWithErrors.offers);

        final offersEntity = OffersEntity(offers: <String>['Offer #3']);
        viewModel = useCase.buildViewModel(offersEntity);
        expect(viewModel, isA<OffersViewModel>());
        expect(viewModel.serviceResponseStatus, ServiceResponseStatus.succeed);
        expect(viewModel.offers, offersEntity.offers);
      });
    });
  });
}

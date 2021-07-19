// @dart=2.9
import 'package:business_banking/features/offers/bloc/offers_bloc.dart';
import 'package:business_banking/features/offers/bloc/offers_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockOffersUseCase extends Mock implements OffersUseCase {}

void main() {
  group('OffersBloc', () {
    group('constructor', () {
      test('should create an instance successfully', () async {
        final bloc = OffersBloc();

        expect(bloc, isA<OffersBloc>());
        expect(bloc.offersUseCase, isA<OffersUseCase>());
        expect(bloc.offersViewModelPipe, isNotNull);
      });
    });

    group('OffersUseCase.execute()', () {
      test(
        "is called when the first listener to the 'offersViewModelPipe' pipe "
        "is subscribed",
        () async {
          final mockOffersUseCase = MockOffersUseCase();
          final bloc = OffersBloc(offersUseCase: mockOffersUseCase);

          expect(bloc.offersUseCase, isA<OffersUseCase>());

          final sub1 = bloc.offersViewModelPipe.receive.listen((event) {});
          final sub2 = bloc.offersViewModelPipe.receive.listen((event) {});
          expect(bloc.offersViewModelPipe.hasListeners, isTrue);
          verify(mockOffersUseCase.execute()).called(1);
          await sub2.cancel();
          await sub1.cancel();
        },
      );
    });

    group('dispose()', () {
      test('should dispose an instance successfully', () async {
        final bloc = OffersBloc()..dispose();

        expect(bloc.offersViewModelPipe.receive, emitsDone);
      });
    });
  });
}

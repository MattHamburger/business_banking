// @dart=2.9

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'package:business_banking/features/hotels/bloc/hotels_usecase.dart';

class HotelUseCaseMock extends Mock implements HotelsUseCase {}

void main() {
  test('HotelsBloc init', () async {
    final bloc = HotelsBloc();
    expect(bloc.hotelsViewModelPipe, isNotNull);
  });

  test('HotelsBloc dispose', () async {
    final bloc = HotelsBloc();
    bloc.dispose();
    expect(bloc.hotelsViewModelPipe.receive, emitsDone);
  });

  test('HotelsBloc on pipe listen', () async {
    HotelUseCaseMock useCaseMock = HotelUseCaseMock();
    final HotelsBloc bloc = HotelsBloc(hotelsUseCase: useCaseMock);
    bloc.hotelsViewModelPipe.receive.listen((event) {});
    verify(useCaseMock.create()).called(1);
  });
}

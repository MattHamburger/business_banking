import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdBloc initialization', () {
    final bloc = AdBloc();
    final pipe = bloc.adHubCardViewModelPipe;
    expect(bloc.adHubCardViewModelPipe, pipe);
  });

  test('AdBloc dispose', () async {
    final bloc = AdBloc();
    bloc.dispose();
    expect(bloc.adHubCardViewModelPipe.receive, emitsDone);
  });
}

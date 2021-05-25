// @dart=2.9

import 'package:business_banking/features/advertisement/ui/ad_hub_card_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class BuildContextMock extends Mock implements BuildContext {}

void main() {
  AdHubCardPresenterActions actions = AdHubCardPresenterActions();

  test('AdHubCardActions test', () async {
    expect(() => actions.navigateToCreditCardDetails(BuildContextMock()),
        throwsA(const TypeMatcher<AssertionError>()));
  });
}

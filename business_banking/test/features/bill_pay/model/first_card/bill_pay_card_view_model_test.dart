// @dart=2.9
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BillPayCard View Model', () {

    final tViewModel = BillPayCardViewModel(
        billsDue: 4,
        serviceRequestStatus: ServiceRequestStatus.none);

    test('properties should match', () {
      expect(tViewModel.billsDue, 4);
      expect(tViewModel.serviceRequestStatus, ServiceRequestStatus.none);
    });

    test('props should match', () async {
      expect(tViewModel.props,
          [tViewModel.billsDue, tViewModel.serviceRequestStatus]);
    });
  });
}

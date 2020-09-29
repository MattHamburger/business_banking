import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service_response_model.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_service_adapter.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mortgage_account_detail_mock_service_adapter.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = MortgageAccountDetailServiceAdapter().createEntity(
        MortgageAccountDetailEntity(),
        MortgageAccountDetailServiceResponseModel.fromJson({
          'name': 'Mortgage',
          'lastFour': '6542',
          'accountType': 'Mortgage',
          'applicationNumber': 876395735,
          'balance': 6735.54,
          'begBalance': 9243.43,
          'penTrans': -228.89,
          'depHolds': 0.00
        }));

    expect(entity, MortgageAccountDetailEntity(
      name: 'Mortgage',
      lastFour: '6542',
      accountType: 'Mortgage',
      applicationNumber: 876395735,
      balance: 6735.54,
      beginningBalance: 9243.43,
      pendingTransactions: -228.89,
      depositHolds: 0.00
    ));
  });

    test('Entity is created by service mock adapter', () {
      final entity = MortgageAccountDetailMockServiceAdapter().createEntity(
          MortgageAccountDetailEntity(),
          MortgageAccountDetailServiceResponseModel.fromJson({
            'name': 'Mortgage',
            'lastFour': '7635',
            'accountType': 'Mortgage',
            'applicationNumber': 876395735,
            'balance': 6735.54,
            'begBalance': 9243.43,
            'penTrans': -228.89,
            'depHolds': 0.00
          }));

      expect(entity, MortgageAccountDetailEntity(
          name: 'Mortgage',
          lastFour: '7635',
          accountType: 'Mortgage',
          applicationNumber: 876395735,
          balance: 6735.54,
          beginningBalance: 9243.43,
          pendingTransactions: -228.89,
          depositHolds: 0.00
      ));
  });
}
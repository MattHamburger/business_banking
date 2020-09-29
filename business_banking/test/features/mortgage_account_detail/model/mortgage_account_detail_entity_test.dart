import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('MortgageAccountDetailEntity testCases ', () {
    final entity =  MortgageAccountDetailEntity(errors:List<EntityError>(),
        name: 'Mortgage',
        lastFour: '7635',
        accountType: 'Mortgage',
        applicationNumber: 876395735,
        balance: 6735.54,
        beginningBalance: 9243.43,
        pendingTransactions: -228.89,
        depositHolds: 0.00
    );
    expect(entity, isA<MortgageAccountDetailEntity>());
    expect(entity.props, isA<List<Object>>());
    expect(entity.merge(errors:List<EntityError>(),name: 'Mortgage',
        lastFour: '7635',
        accountType: 'Mortgage',
        applicationNumber: 876395735,
        balance: 6735.54,
        beginningBalance: 9243.43,
        pendingTransactions: -228.89,
        depositHolds: 0.00), isA<MortgageAccountDetailEntity>());
    expect(entity.merge(), isA<MortgageAccountDetailEntity>());
    expect(entity.toString(), isA<String>());
  });
}
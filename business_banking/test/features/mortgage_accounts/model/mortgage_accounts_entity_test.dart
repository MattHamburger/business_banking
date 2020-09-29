import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('MortgageAccountsEntity testCases ', () {
    final entity = MortgageAccountsEntity(errors:List<EntityError>(),name: 'Employee Mortgage',
        lastFour: '7635',
        balance: 7898.54);
    expect(entity, isA<MortgageAccountsEntity>());
    expect(entity.props, isA<List<Object>>());
    expect(entity.merge(errors:List<EntityError>(),name:'Employee Mortgage',lastFour:'7635', balance:7898.54), isA<MortgageAccountsEntity>());
    expect(entity.merge(), isA<MortgageAccountsEntity>());
    expect(entity.toString(), isA<String>());
  });
}
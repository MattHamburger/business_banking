// @dart=2.9
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BillPayCard Entity', () {

    final tEntity =
    BillPayCardEntity(billsDue: 4, errors: []);

    test('properties should match', () {
      expect(tEntity.billsDue, 4);
    });

    test('props should match', () async {
      expect(tEntity.props, [tEntity.errors, tEntity.billsDue]);
    });

    test('merge func should return new Entity with updated data', () async {
      var newEntity = tEntity.merge(billsDue: 3);
      expect(newEntity.billsDue, 3);
    });
  });
}

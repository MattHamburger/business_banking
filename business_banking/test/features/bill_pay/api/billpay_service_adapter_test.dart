import 'package:business_banking/features/billpay/api/billpay_service_response_model.dart';
import 'package:business_banking/features/billpay/bloc/billpay_service_adapter.dart';
import 'package:business_banking/features/billpay/model/billpay_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = BillPayServiceAdapter().createEntity(
        BillPayEntity(),
        BillPayServiceResponseModel.fromJson({
          'succeeded': true,
        }));

    expect(entity, BillPayEntity(amount: 0));
  });
}

import 'package:business_banking/features/transfer_funds/api/transfer_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/transfer_response_model.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TransferFundsServiceAdapter serviceAdapter;

  setUp(() {
    serviceAdapter = TransferFundsServiceAdapter();
  });

  test('Entity for transfer to send is created by service adapter', () {

    // testing createEntity method
    final entity = serviceAdapter.createEntity(
        TransferFundsEntity(),
        TransferFundsResponseModel.fromJson({"confirmation" : "123456789"}));
    expect(entity.id, '123456789');

    // testing createRequest method
    DateTime date = DateTime.now();
    final entity1 = new TransferFundsEntity(fromAccount: '1111111111', toAccount: '4444444444', amount: '25.5', date: date);
    TransferFundsRequestModel model = serviceAdapter.createRequest(entity1);
    expect(model, TransferFundsRequestModel(fromAccount: '1111111111', toAccount: '4444444444', amount: '25.5', date: date));
  });
}
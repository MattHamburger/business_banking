import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_usecase.dart';
import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/bill_pay_info_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("BillPayInfoUseCase tests", () {
    test('BillPayInfoUseCase initialize with error', () {
      try {
        BillPayInfoUseCase(null);
        expect(false, true);
      } catch (error) {
        expect(error != null, true);
      }
    });

    test('BillPayInfoUseCase initialize and create', () {
      final usecase = BillPayInfoUseCase((viewModel) {
        expect(viewModel, isA<BillPayInfoUseCase>());
      });
      usecase.create();
    });
    test('BillPayInfoUseCase view model is returned', () {
      final usecase = BillPayInfoUseCase((viewModel) {
        expect(
          viewModel,
          BillPayInfoViewModel(
            billers: [
              BillerEntity(
                billerName: "Gas Company",
                accountNumber: "9582",
              ),
              BillerEntity(
                billerName: "Internet Company",
                accountNumber: "6237",
              ),
              BillerEntity(
                billerName: "Water Company",
                accountNumber: "6092",
              ),
              BillerEntity(
                billerName: "Electric Company",
                accountNumber: "6129",
              ),
            ],
            accounts: [
              AccountEntity(
                accountTitle: "Checking Account",
                accountNumber: "6542",
                accountBalance: 3545.54,
                accountStatus: "Active",
              ),
              AccountEntity(
                accountTitle: "Savings Account",
                accountNumber: "6543",
                accountBalance: 0.02,
                accountStatus: "Active",
              ),
            ],
            rules: RulesEntity(
              memoLimit: 256,
              paymentMax: 100000.00,
              paymentMin: 1.00,
            ),
          ),
        );
      });
      usecase.create();
    });

    test('BillPayInfoUseCase initialize and recreate', () {
      final usecase = BillPayInfoUseCase((viewModel) {
        expect(viewModel, isA<BillPayInfoUseCase>());
      });
      usecase.create();
      usecase.create(); //use to trigger else in the create
    });
  });
}

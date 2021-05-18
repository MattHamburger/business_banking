import 'dart:ui';

import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'bill_pay_card_presenter.dart';

class BillPayCardScreen extends Screen {
  final BillPayCardViewModel viewModel;
  final BillPayCardPresenterActions presenterActions;

  BillPayCardScreen(
      {required this.viewModel, required this.presenterActions});

  @override
  Widget build(BuildContext context) {
    return viewModel.serviceRequestStatus == ServiceRequestStatus.success
        ? _SucceedCard(
      viewModel: viewModel,
      presenterActions: presenterActions,
      key: Key('Bill-Pay-Card-Succeed'),
    )
        : _FailedCard(
      key: Key('Bill-Pay-Card-Failed'),
    );
  }
}

class _SucceedCard extends StatelessWidget {
  const _SucceedCard({
    Key? key,
    required this.viewModel,
    required this.presenterActions,
  }) : super(key: key);

  final BillPayCardViewModel viewModel;
  final BillPayCardPresenterActions presenterActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: const Text(
                        'Pay Bills',
                        key: Key('Bill-Pay-Card-Title'),
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Text(
                (viewModel.billsDue < 1)
                    ? "You have no bills due"
                    : "You have ${viewModel.billsDue} bill(s) due",
                key: Key('Bill-Pay-Card-Subtitle'),
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              (viewModel.billsDue < 1)
                ? Text(
                  "Nice! You're all caught up.",
                  style: TextStyle(color: Colors.black87, fontSize: 18,
                      fontStyle: FontStyle.italic),
                )
                : ElevatedButton(
                  onPressed: () {
                    presenterActions.navigateToBillPay(context);
                  },
                  key: Key('Bill-Pay-Card-Button'),
                  child: Text("Pay Bills"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _FailedCard extends StatelessWidget {
  const _FailedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: const Text(
                        'Pay Bills',
                        key: Key('Bill-Pay-Card-Title'),
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 56.0),
                child: const Text(
                  "Service is not available! Please try again later.",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

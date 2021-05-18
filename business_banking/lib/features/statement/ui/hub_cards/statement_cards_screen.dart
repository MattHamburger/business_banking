import 'dart:ui';

import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'statement_cards_presenter.dart';

class StatementCardScreen extends Screen {
  final StatementCardViewModel viewModel;
  final StatementCardPresenterActions presenterActions;

  StatementCardScreen(
      {required this.viewModel, required this.presenterActions});

  @override
  Widget build(BuildContext context) {
    return viewModel.serviceResponseStatus == ServiceResponseStatus.succeed
        ? _SuccessCard(
            viewModel: viewModel,
            pressenterActions: presenterActions,
            key: Key('statement-Card-Succeed'),
          )
        : _FailedCard(
            key: Key('statement-Check-Card-Failed'),
          );
  }
}

class _SuccessCard extends StatelessWidget {
  const _SuccessCard({
    Key? key,
    required this.viewModel,
    required this.pressenterActions,
  }) : super(key: key);

  final StatementCardViewModel viewModel;
  final StatementCardPresenterActions pressenterActions;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: EdgeInsets.all(5.0),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey[500],
          elevation: 3.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text(
                  'View Account Statements',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: viewModel.accounts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: StatementItemCard(
                          accountInfo: viewModel.accounts[index],
                          // key: key,
                        ),
                        onTap: () {
                          pressenterActions.navigateToViewStatement(context);
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class _FailedCard extends StatelessWidget {
  const _FailedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Card(
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'View Account Statements',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
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

class StatementItemCard extends StatelessWidget {
  const StatementItemCard({
    Key? key,
    required this.accountInfo,
  }) : super(key: key);

  final AccountInfoStruct accountInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your current mobile deposit limit is \$${accountInfo.depositLimit}",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Text(
                '${accountInfo.accountNickname}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '\$${accountInfo.availableBalance}',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

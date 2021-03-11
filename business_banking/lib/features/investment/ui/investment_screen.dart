import 'dart:ui';

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../model/investment_view_model.dart';

class InvestmentScreen extends Screen {
  final InvestmentViewModel viewModel;
  final VoidCallback navigateToInvestmentDetail;

  InvestmentScreen(
      {@required this.viewModel, @required this.navigateToInvestmentDetail})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AccountCard(
        viewModel: viewModel,
        key: Key('investmentCard'),
      ),
      onTap: () {
        navigateToInvestmentDetail();
      },
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final InvestmentViewModel viewModel;

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
                        'Investment Account Balance',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const Text(
                "Account value / Today's net change",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              Text(
                '\$${viewModel.accountBalance}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '\$${viewModel.totalGainValue} (${viewModel.totalGainPercent}%)',
                  style: TextStyle(
                      color: Colors.red,
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

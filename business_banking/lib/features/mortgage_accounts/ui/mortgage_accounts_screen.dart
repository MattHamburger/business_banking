import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class MortgageAccountsScreen extends Screen {
  final MortgageAccountsViewModel viewModel;
  final VoidCallback navigateToAccountDetail;

  MortgageAccountsScreen({@required this.viewModel, @required this.navigateToAccountDetail})
      : assert(() {
    return viewModel != null;
  }());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: AccountCard(
            viewModel: viewModel,
            key: Key('mortgageAccountCard1'),
          ),
          onTap: () {
            navigateToAccountDetail();
          },
        )
      ],
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final MortgageAccountsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        viewModel.name,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AutoSizeText(
                      ' *' + viewModel.lastFour.toString(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Balance:",
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                    ),
                    Text(
                      '\$' + viewModel.balance.toStringAsFixed(2),
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                      key: Key('mortgageAccountbalance'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:business_banking/features/bank_locator/model/bank_locator_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BankLocatorScreen extends Screen {
  final BankLocatorViewModel viewModel;
  final Function onChangeLocation;
  final Function navigateToBankLocator;

  BankLocatorScreen({
    @required this.viewModel,
    @required this.onChangeLocation,
    @required this.navigateToBankLocator,
  }) : assert(viewModel != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BankLocatorCard(key: Key('bank-locator-card')),
      onTap: navigateToBankLocator,
    );
  }
}

class BankLocatorCard extends StatelessWidget {
  const BankLocatorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BankLocatorCard.build()');
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.search),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Find a bank'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

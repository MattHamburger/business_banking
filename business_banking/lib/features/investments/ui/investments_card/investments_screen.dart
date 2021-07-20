import 'package:business_banking/features/investments/model/investments_view_model.dart';
import 'package:business_banking/features/investments/ui/investments_card/investments_feature_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class InvestmentsScreen extends Screen {
  final InvestmentsViewModel viewModel;
  final InvestmentsFeatureActions actions;

  InvestmentsScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.actions.navigateToInvestments(context),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: EdgeInsets.all(5.0),
        child: Card(
            color: Colors.green,
            shadowColor: Colors.grey[500],
            elevation: 3.0,
            child: InvestmentsCard()),
      ),
    );
  }
}

class InvestmentsCard extends StatelessWidget {
  const InvestmentsCard({
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
                        'Investments',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Combined Value',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('\$164,435.42',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'Day Change 0.00%',
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

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/mortgage_view_model.dart';

class MortgageScreen extends Screen {
  final MortgageViewModel viewModel;
  final VoidCallback navigateToMortgageDetail;

  MortgageScreen(
      {@required this.viewModel, @required this.navigateToMortgageDetail})
      : assert(viewModel != null);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: MortgageCard(viewModel: viewModel),
        key: Key('mortgageDetailButtonKey'),
        onTap: () {
          navigateToMortgageDetail();
        });
  }
}

class MortgageCard extends StatelessWidget {
  const MortgageCard({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final MortgageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'MORTGAGE INFO',
              key: Key('mortgageInfoCardTitle'),
            ),
            Row(
              children: [
                Text('Next payment amount due:',
                    key: Key('mortgageInfoCardSubtitle')),
                Text(viewModel.monthlyAmountDue,
                    key: Key('mortgageInfoCardMonthlyAmountDue')),
              ],
            ),
            Row(
              children: [
                Text(
                  'Payment amount due date:',
                ),
                Text(
                  viewModel.paymentDue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:flutter/material.dart';

class CDToAccountsDropDown extends StatelessWidget {
  final CheckDepositViewModel viewModel;
  final Function onChangeSelectedToAccount;
  final Key key;

  CDToAccountsDropDown(
      {this.key, this.viewModel, this.onChangeSelectedToAccount});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _fromMenuItems =
        buildDropdownMenuItems(viewModel.toAccounts);
    return DropdownButton<String>(
      key: key,
      isExpanded: true,
      items: _fromMenuItems,
      onChanged: (String value) {
        onChangeSelectedToAccount(value);
      },
      hint: Text('Select a To Account'),
      value: viewModel.toAccount,
    );
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List accounts) {
    List<DropdownMenuItem<String>> items = List();
    int itemIndex = 0;
    for (String account in accounts) {
      itemIndex++;
      items.add(
        DropdownMenuItem(
          value: account,
          child: Text(account, key: Key('account_to$itemIndex')),
        ),
      );
    }
    return items;
  }
}

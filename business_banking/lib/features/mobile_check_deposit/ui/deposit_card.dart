import 'package:flutter/material.dart';

import 'check_deposit_widget.dart';

class CheckDepositCard extends StatelessWidget {
  const CheckDepositCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
    Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new CheckDepositWidget(),
                    maintainState: false));

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text('Mobile Check Deposit',
                style: TextStyle(color: Colors.lightGreen, fontSize: 30.0),
          ),
        ),
      ),
    ));
  }
}

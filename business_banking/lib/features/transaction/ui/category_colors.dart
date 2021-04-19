import 'package:business_banking/features/transaction/enums.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

class CategoryColors extends StatelessWidget {
  const CategoryColors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction Categories",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 2.2,
                crossAxisCount: 3,
                children: List.generate(
                    TransactionCategory.values.length,
                    (index) => Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              color: TransactionCategory.values[index].color,
                            ),
                            const SizedBox(width: 5),
                            Text(EnumToString.convertToString(
                                TransactionCategory.values[index]))
                          ],
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

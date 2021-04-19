import 'package:flutter/material.dart';

enum TransactionCategory {
  rent,
  restaurant,
  transportation,
  haircut,
  utilities,
  miscellaneous,
  groceries,
  shopping,
  tuition,
  charity,
  service,
  gas,
  income,
  transfer,
  coffeeShop,
  movies,
  airTravel,
  health,
  subscriptions,
  withdrawals,
}

extension TransactionCategoryExtension on TransactionCategory {
  // ignore: missing_return
  Color get color {
    switch (this) {
      case TransactionCategory.rent:
        return Colors.blue;
        break;
      case TransactionCategory.restaurant:
        return Colors.red;
        break;
      case TransactionCategory.transportation:
        return Colors.green;
        break;
      case TransactionCategory.haircut:
        return Colors.orange;
        break;
      case TransactionCategory.utilities:
        return Colors.black;
        break;
      case TransactionCategory.miscellaneous:
        return Colors.pink;
        break;
      case TransactionCategory.groceries:
        return Colors.purple;
        break;
      case TransactionCategory.shopping:
        return Colors.amber;
        break;
      case TransactionCategory.tuition:
        return Colors.blueAccent;
        break;
      case TransactionCategory.charity:
        return Colors.cyan;
        break;
      case TransactionCategory.service:
        return Colors.lightBlue;
        break;
      case TransactionCategory.gas:
        return Colors.lime;
        break;
      case TransactionCategory.income:
        return Colors.yellow;
        break;
      case TransactionCategory.transfer:
        return Colors.orangeAccent;
        break;
      case TransactionCategory.coffeeShop:
        return Colors.brown;
        break;
      case TransactionCategory.movies:
        return Colors.indigo;
        break;
      case TransactionCategory.airTravel:
        return Colors.teal;
      case TransactionCategory.subscriptions:
        return Colors.blueGrey;
        break;
      case TransactionCategory.health:
        return Colors.indigoAccent;
        break;
      case TransactionCategory.withdrawals:
        return Colors.black12;
        break;
      default:
        return Colors.lightGreen;
        break;
    }
  }
}

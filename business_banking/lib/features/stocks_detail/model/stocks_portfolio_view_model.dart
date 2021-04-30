import 'package:clean_framework/clean_framework.dart';

class StocksPortfolioViewModel extends ViewModel {
  final List<Map<String, dynamic>> stocksList;

  StocksPortfolioViewModel({required this.stocksList});

  double get totalValue {
    double value = 0.00;
    for (Map<String, dynamic> stock in stocksList) {
      value += stock['value'];
    }

    return value;
  }

  @override
  List<Object?> get props => [stocksList];
}

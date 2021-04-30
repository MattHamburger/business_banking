import 'package:clean_framework/clean_framework.dart';

class StocksListViewModel extends ViewModel {
  final List<Map<String, dynamic>> stocksList;

  StocksListViewModel({required this.stocksList});

  @override
  List<Object?> get props => [stocksList];
}

import 'package:clean_framework/clean_framework.dart';

class CashbackFormViewModel extends ViewModel {
  final String city;

  CashbackFormViewModel(this.city);

  List<Object?> get props => [city];
}


// class Model

// CashbackFormViewModel a = CashbackFormViewModel('Houston')
// CashbackFormViewModel b = CashbackFormViewModel('Houston')

// if (a == b)

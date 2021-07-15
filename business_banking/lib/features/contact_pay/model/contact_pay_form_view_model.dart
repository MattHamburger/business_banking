import 'package:clean_framework/clean_framework.dart';

class ContactPayFormViewModel extends ViewModel {
  final String city;

  ContactPayFormViewModel({required this.city});

  List<Object?> get props => [city];
}

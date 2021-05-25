import 'package:clean_framework/clean_framework.dart';

class AdHubCardViewModel extends ViewModel {
  final String id;
  final String adTitle;
  final String adDescription;
  final String adImage;
  final String adIconImage;

  AdHubCardViewModel(
      {required this.adTitle,
      required this.adIconImage,
      required this.adImage,
      required this.adDescription,
      required this.id});

  @override
  List<Object> get props => [adTitle, adIconImage];
}

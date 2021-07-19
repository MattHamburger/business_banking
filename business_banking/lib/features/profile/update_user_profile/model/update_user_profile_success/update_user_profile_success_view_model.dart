import 'package:clean_framework/clean_framework.dart';

class UpdateUserProfileSuccessViewModel extends ViewModel {
  final String? userName;
  final bool? isProfileUpdated;
  final serviceResponseStatus;

  UpdateUserProfileSuccessViewModel(
      {required this.userName,
      required this.isProfileUpdated,
      required this.serviceResponseStatus});

  @override
  List<Object> get props => [
        userName!,
        isProfileUpdated!,
        serviceResponseStatus,
      ];
}

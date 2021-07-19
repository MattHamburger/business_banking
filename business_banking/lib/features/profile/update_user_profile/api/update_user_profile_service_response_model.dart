import 'package:clean_framework/clean_framework_defaults.dart';

class UpdateUserProfileServiceResponseModel extends JsonResponseModel {
  final bool isProfileUpdated;

  UpdateUserProfileServiceResponseModel.fromJson(Map<String, dynamic> json)
      : isProfileUpdated = json['isProfileUpdated'] ?? 'false';

  @override
  List<Object> get props => [isProfileUpdated];
}

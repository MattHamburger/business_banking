import 'package:clean_framework/clean_framework_defaults.dart';

class AdServiceResponseModel extends JsonResponseModel {
  final String id;
  final String adTitle;
  final String adDescription;
  final String adImage;
  final String adIconImage;

  AdServiceResponseModel(this.id, this.adTitle, this.adDescription,
      this.adIconImage, this.adImage);

  AdServiceResponseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        adTitle = json['adTitle'] ?? '',
        adDescription = json['adDescription'] ?? '',
        adImage = json['adImage'] ?? '',
        adIconImage = json['adIconImage'] ?? '';

  @override
  List<Object?> get props => [
        this.id,
        this.adTitle,
        this.adDescription,
        this.adImage,
        this.adIconImage
      ];
}

import 'package:clean_framework/clean_framework.dart';

class AdEntity extends Entity {
  final String id;
  final String adTitle;
  final String adDescription;
  final String adImage;
  final String adIconImage;

  AdEntity(
      {List<EntityFailure> errors = const [],
      String? id,
      String? adTitle,
      String? adDescription,
      String? adImage,
      String? adIconImage})
      : id = id ?? '',
        adTitle = adTitle ?? '',
        adDescription = adDescription ?? '',
        adImage = adImage ?? '',
        adIconImage = adIconImage ?? '',
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, id, adTitle, adDescription, adImage, adIconImage];

  @override
  merge(
      {errors,
      String? id,
      String? adTitle,
      String? adDescription,
      String? adImage,
      String? adIconImage}) {
    return AdEntity(
        errors: errors ?? this.errors,
        id: id ?? this.id,
        adTitle: adTitle ?? this.adTitle,
        adDescription: adDescription ?? this.adDescription,
        adImage: adImage ?? this.adImage,
        adIconImage: adIconImage ?? this.adIconImage);
  }
}

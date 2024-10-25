import '../../domain/entities/apod_entity.dart';

class ApodModel extends ApodEntity {
  ApodModel({
    required String title,
    required String explanation,
    required String url,
    required String date,
    String? hdurl,
    String? mediaType,
    String? copyright,
  }) : super(
          title: title,
          explanation: explanation,
          url: url,
          date: date,
          hdurl: hdurl,
          mediaType: mediaType,
          copyright: copyright,
        );

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
        title: json['title'],
        explanation: json['explanation'],
        url: json['url'],
        date: json['date'],
        hdurl: json['hdurl'],
        mediaType: json['media_type'],
        copyright: json['copyright'],
      );
}

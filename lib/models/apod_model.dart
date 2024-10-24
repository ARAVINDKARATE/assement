class ApodModel {
  final String title;
  final String explanation;
  final String url;
  final String date;
  final String? hdurl;
  final String? mediaType;
  final String? serviceVersion;
  final String? copyright;

  ApodModel({
    required this.title,
    required this.explanation,
    required this.url,
    required this.date,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.copyright,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      title: json['title'],
      explanation: json['explanation'],
      url: json['url'],
      date: json['date'],
      hdurl: json['hdurl'],
      mediaType: json['media_type'],
      serviceVersion: json['service_version'],
      copyright: json['copyright'],
    );
  }
}

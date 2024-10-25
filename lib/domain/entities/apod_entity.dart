class ApodEntity {
  final String title;
  final String explanation;
  final String url;
  final String date;
  final String? hdurl;
  final String? mediaType;
  final String? copyright;

  ApodEntity({
    required this.title,
    required this.explanation,
    required this.url,
    required this.date,
    this.hdurl,
    this.mediaType,
    this.copyright,
  });
}

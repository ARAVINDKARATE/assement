import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/models/apod_model.dart';

class ApodApiService {
  final String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String _apiKey = 'DEMO_KEY';

  Future<ApodModel> fetchApod() async {
    final response = await http.get(Uri.parse('$_baseUrl?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      return ApodModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch APOD');
    }
  }
}

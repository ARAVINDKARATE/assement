import '../api/apod_api_service.dart';
import '../models/apod_model.dart';

class ApodRepository {
  final ApodApiService apiService;

  ApodRepository(this.apiService);

  Future<ApodModel> getApod() async {
    return await apiService.fetchApod();
  }
}

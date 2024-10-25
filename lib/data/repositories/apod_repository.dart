import '../../domain/entities/apod_entity.dart';
import '../../domain/repositories/apod_repository_interface.dart';
import '../../api/apod_api_service.dart';

class ApodRepository implements ApodRepositoryInterface {
  final ApodApiService apiService;

  ApodRepository(this.apiService);

  @override
  Future<ApodEntity> getApod() async => await apiService.fetchApod();
}

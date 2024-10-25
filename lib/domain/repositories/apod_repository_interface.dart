import '../entities/apod_entity.dart';

abstract class ApodRepositoryInterface {
  Future<ApodEntity> getApod();
}

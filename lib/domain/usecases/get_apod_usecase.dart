import '../entities/apod_entity.dart';
import '../repositories/apod_repository_interface.dart';

class GetApodUseCase {
  final ApodRepositoryInterface repository;

  GetApodUseCase(this.repository);

  Future<ApodEntity> call() => repository.getApod();
}

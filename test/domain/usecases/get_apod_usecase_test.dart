import 'package:assement/data/repositories/apod_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:assement/domain/entities/apod_entity.dart';
import 'package:assement/domain/usecases/get_apod_usecase.dart';

class MockApodRepository extends Mock implements ApodRepository {}

void main() {
  late GetApodUseCase getApodUseCase;
  late MockApodRepository mockApodRepository;

  setUp(() {
    mockApodRepository = MockApodRepository();
    getApodUseCase = GetApodUseCase(mockApodRepository);
  });

  test('should return ApodEntity when the repository call is successful', () async {
    // Arrange
    final apodEntity = ApodEntity(
      title: 'Test Title',
      explanation: 'Test Explanation',
      url: 'https://example.com/image.jpg',
      date: '2024-10-25',
    );
    when(mockApodRepository.getApod()).thenAnswer((_) async => apodEntity);

    // Act
    final result = await getApodUseCase();

    // Assert
    expect(result, apodEntity);
    verify(mockApodRepository.getApod()).called(1);
    verifyNoMoreInteractions(mockApodRepository);
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:assement/domain/entities/apod_entity.dart';
import 'package:assement/domain/usecases/get_apod_usecase.dart';
import 'package:assement/presentation/cubits/apod_cubit.dart';
import 'package:assement/presentation/cubits/apod_state.dart';

class MockGetApodUseCase extends Mock implements GetApodUseCase {}

void main() {
  late ApodCubit apodCubit;
  late MockGetApodUseCase mockGetApodUseCase;

  setUp(() {
    mockGetApodUseCase = MockGetApodUseCase();
    apodCubit = ApodCubit(mockGetApodUseCase);
  });

  tearDown(() {
    apodCubit.close();
  });

  final apodEntity = ApodEntity(
    title: 'Test Title',
    explanation: 'Test Explanation',
    url: 'https://example.com/image.jpg',
    date: '2024-10-25',
  );

  blocTest<ApodCubit, ApodState>(
    'emits [ApodLoading, ApodLoaded] when fetchApod is successful',
    build: () {
      when(mockGetApodUseCase()).thenAnswer((_) async => apodEntity);
      return apodCubit;
    },
    act: (cubit) => cubit.fetchApod(),
    expect: () => [ApodLoading(), ApodLoaded(apodEntity)],
  );

  blocTest<ApodCubit, ApodState>(
    'emits [ApodLoading, ApodError] when fetchApod fails',
    build: () {
      when(mockGetApodUseCase()).thenThrow(Exception('Failed to fetch APOD.'));
      return apodCubit;
    },
    act: (cubit) => cubit.fetchApod(),
    expect: () => [ApodLoading(), ApodError('Failed to load APOD.')],
  );
}

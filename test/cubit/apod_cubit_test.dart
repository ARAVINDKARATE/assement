import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:assement/blocs/apod_cubit.dart';
import 'package:assement/blocs/apod_state.dart';
import 'package:assement/models/apod_model.dart';
import 'package:assement/repositories/apod_repository.dart';

class MockApodRepository extends Mock implements ApodRepository {}

void main() {
  late MockApodRepository mockApodRepository;
  late ApodCubit apodCubit;

  setUp(() {
    mockApodRepository = MockApodRepository();
    apodCubit = ApodCubit(mockApodRepository);
  });

  tearDown(() {
    apodCubit.close();
  });

  group('ApodCubit', () {
    test('initial state is ApodInitial', () {
      expect(apodCubit.state, equals(ApodInitial()));
    });

    blocTest<ApodCubit, ApodState>(
      'emits [ApodLoading, ApodLoaded] when fetchApod is successful',
      build: () {
        when(mockApodRepository.getApod()).thenAnswer((_) async => ApodModel(
              title: 'Test Title',
              explanation: 'Test Explanation',
              url: 'https://test.url',
              mediaType: 'image',
              date: '2024-10-24',
            ));
        return apodCubit;
      },
      act: (cubit) => cubit.fetchApod(),
      expect: () => [
        ApodLoading(),
        isA<ApodLoaded>(),
      ],
    );

    blocTest<ApodCubit, ApodState>(
      'emits [ApodLoading, ApodError] when fetchApod fails',
      build: () {
        when(mockApodRepository.getApod()).thenThrow(Exception('Failed to load APOD.'));
        return apodCubit;
      },
      act: (cubit) => cubit.fetchApod(),
      expect: () => [
        ApodLoading(),
        isA<ApodError>(),
      ],
    );
  });
}

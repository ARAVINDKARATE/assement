import 'package:assement/blocs/apod_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/apod_repository.dart';

class ApodCubit extends Cubit<ApodState> {
  final ApodRepository apodRepository;

  ApodCubit(this.apodRepository) : super(ApodInitial());

  Future<void> fetchApod() async {
    try {
      emit(ApodLoading());
      final apod = await apodRepository.getApod();
      emit(ApodLoaded(apod));
    } catch (e) {
      emit(ApodError('Failed to load APOD.'));
    }
  }
}

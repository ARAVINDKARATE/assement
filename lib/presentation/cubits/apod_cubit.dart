import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_apod_usecase.dart';
import 'apod_state.dart';

class ApodCubit extends Cubit<ApodState> {
  final GetApodUseCase getApod;

  ApodCubit(this.getApod) : super(ApodInitial());

  Future<void> fetchApod() async {
    try {
      emit(ApodLoading());
      final apod = await getApod();
      emit(ApodLoaded(apod));
    } catch (e) {
      emit(ApodError('Failed to load APOD.'));
    }
  }
}

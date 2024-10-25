import '../../domain/entities/apod_entity.dart';

abstract class ApodState {}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodLoaded extends ApodState {
  final ApodEntity apod;

  ApodLoaded(this.apod);
}

class ApodError extends ApodState {
  final String error;

  ApodError(this.error);
}

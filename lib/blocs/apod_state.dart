import 'package:assement/models/apod_model.dart';

abstract class ApodState {}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodLoaded extends ApodState {
  final ApodModel apod;

  ApodLoaded(this.apod);
}

class ApodError extends ApodState {
  final String error;

  ApodError(this.error);
}

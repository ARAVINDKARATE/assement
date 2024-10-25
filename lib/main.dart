import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/apod_repository.dart';
import 'api/apod_api_service.dart';
import 'domain/usecases/get_apod_usecase.dart';
import 'presentation/cubits/apod_cubit.dart';
import 'presentation/screens/apod_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apodApiService = ApodApiService();
    final apodRepository = ApodRepository(apodApiService);
    final getApodUseCase = GetApodUseCase(apodRepository);

    return MaterialApp(
      title: 'NASA APOD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => ApodCubit(getApodUseCase),
        child: const ApodScreen(),
      ),
    );
  }
}

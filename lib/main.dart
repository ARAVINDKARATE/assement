import 'package:assement/api/apod_api_service.dart';
import 'package:assement/blocs/apod_cubit.dart';
import 'package:assement/repositories/apod_repository.dart';
import 'package:assement/view/apod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apodApiService = ApodApiService();
    final apodRepository = ApodRepository(apodApiService);
    return MaterialApp(
      title: 'NASA APOD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ApodCubit(apodRepository),
        child: const ApodScreen(),
      ),
    );
  }
}

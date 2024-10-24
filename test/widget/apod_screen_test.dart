import 'package:assement/blocs/apod_cubit.dart';
import 'package:assement/blocs/apod_state.dart';
import 'package:assement/models/apod_model.dart';
import 'package:assement/view/apod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApodCubit extends Mock implements ApodCubit {}

void main() {
  testWidgets('Shows loading indicator while fetching APOD', (WidgetTester tester) async {
    final mockCubit = MockApodCubit();

    when(mockCubit.state).thenReturn(ApodLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ApodCubit>(
          create: (context) => mockCubit,
          child: const ApodScreen(),
        ),
      ),
    );

    expect(find.text('Fetching latest pic of the day'), findsOneWidget);
  });

  testWidgets('Shows APOD when loaded successfully', (WidgetTester tester) async {
    final mockCubit = MockApodCubit();
    final apodModel = ApodModel(date: '2024-10-23', explanation: 'Cool picture', url: 'image_url', title: '');

    when(mockCubit.state).thenReturn(ApodLoaded(apodModel));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ApodCubit>(
          create: (context) => mockCubit,
          child: const ApodScreen(),
        ),
      ),
    );

    expect(find.text('Cool picture'), findsOneWidget);
    expect(find.text('2024-10-23'), findsOneWidget);
  });

  testWidgets('Shows error message on failure', (WidgetTester tester) async {
    final mockCubit = MockApodCubit();

    when(mockCubit.state).thenReturn(ApodError('API Error'));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ApodCubit>(
          create: (context) => mockCubit,
          child: const ApodScreen(),
        ),
      ),
    );

    expect(find.text('API Error'), findsOneWidget);
  });
}

import 'package:assement/blocs/apod_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/apod_cubit.dart';
import '../widgets/apod_image_widget.dart';
import '../widgets/error_widget.dart';

class ApodScreen extends StatefulWidget {
  const ApodScreen({super.key});

  @override
  _ApodScreenState createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApodCubit>().fetchApod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 138, 70, 255),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BlocBuilder<ApodCubit, ApodState>(
            builder: (context, state) {
              if (state is ApodLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is ApodLoaded) {
                return ApodImageWidget(apod: state.apod);
              } else if (state is ApodError) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ErrorDisplay(
                      message: state.error,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      textColor: Colors.red,
                    ),
                  ),
                );
              }
              return const Center(
                child: Text(
                  'No APOD available.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ApodCubit>().fetchApod();
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

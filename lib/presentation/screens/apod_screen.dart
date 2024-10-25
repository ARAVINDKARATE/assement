import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/apod_cubit.dart';
import '../cubits/apod_state.dart';
import '../widgets/apod_image_widget.dart';
import '../widgets/error_display_widget.dart';

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
      appBar: AppBar(title: const Text('Astronomy Picture of the Day')),
      body: BlocBuilder<ApodCubit, ApodState>(
        builder: (context, state) {
          if (state is ApodLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ApodLoaded) {
            return ApodImageWidget(apod: state.apod);
          } else if (state is ApodError) {
            return ErrorDisplayWidget(message: state.error);
          }
          return const Center(child: Text('No APOD available.'));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ErrorDisplay extends StatelessWidget {
  final String message;

  const ErrorDisplay({
    super.key,
    required this.message,
    required Color backgroundColor,
    required MaterialColor textColor,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showToast(message);
    });

    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

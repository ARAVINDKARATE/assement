import 'package:flutter/material.dart';
import '../../domain/entities/apod_entity.dart';

class ApodImageWidget extends StatelessWidget {
  final ApodEntity apod;

  const ApodImageWidget({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 51, 29, 90), Color.fromARGB(255, 36, 72, 134)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300, // Fixed height for the image container
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  apod.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.blue,
                        value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text(
                      'Failed to load image',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              apod.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              apod.explanation,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Text(
              'Date: ${apod.date}',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white60,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10),
            if (apod.copyright != null)
              Text(
                '© ${apod.copyright}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
                textAlign: TextAlign.right,
              ),
          ],
        ),
      ),
    );
  }
}

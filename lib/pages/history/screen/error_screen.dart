import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            const Text('An error occured'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Return to Home')
            )
          ],
        );
      },
    );
  }
}
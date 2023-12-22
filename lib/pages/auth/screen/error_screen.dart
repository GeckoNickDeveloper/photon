import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/providers/auth/providers.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:(context, ref, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Something went horribly wrong...'),
            ElevatedButton(
              onPressed: () {
                Scanner().unlock();
                ref.read(isScanningProvider.notifier).state = true;
              },
              child: const Text('Retry')
            )
          ],
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Providers
import 'package:photon/providers/global/providers.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final logged = ref.watch(isLoggedProvider);

        if(!logged) {
          ref.read(serverInformationsProvider.notifier).state = null;
          Navigator.pop(context);
        }

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
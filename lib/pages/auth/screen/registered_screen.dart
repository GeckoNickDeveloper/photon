import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/providers/auth/providers.dart';

class RegisteredScreen extends StatelessWidget {
  const RegisteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('REGISTRATO'),
        Consumer(
          builder: (context, ref, _) {
            return ElevatedButton(
              onPressed: () {
                Scanner().unlock();
                ref.read(isScanningProvider.notifier).state = true;
                Navigator.pop(context);
              },
              child: const Placeholder()
            );
          },
        ),
      ],
    );
  }
  
}
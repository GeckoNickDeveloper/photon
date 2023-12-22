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
        final server = ref.watch(serverInformationsProvider);

        if(server == null) {
          Navigator.pop(context);
        }

        return const Text('Error');
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers
import 'package:photon/providers/global/providers.dart';
import 'package:photon/providers/auth/providers.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return const Center(
          child: Placeholder(),
        );
      },
    );
  }
}
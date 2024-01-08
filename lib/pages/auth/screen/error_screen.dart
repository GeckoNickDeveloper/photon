import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/providers/auth/providers.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;
  
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:(context, ref, child) {
        String text = getCustomMessageFromError(error);
        
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Scanner().unlock();
                  ref.read(isScanningProvider.notifier).state = true;
                },
                child: const Text('Retry')
              )
            ],
          ),
        );
      },
    );
  }
}
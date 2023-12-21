import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/providers/providers.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final server = ref.watch(serverInformationsProvider);
        final uploading = ref.watch(uploadImageListNotifier.notifier).uploading;
        final list = ref.watch(uploadImageListNotifier);

        if(server == null) {
          Navigator.pop(context);
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder:(context, index) {
                    return const Icon(Icons.place);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if(uploading) {
                    ref.read(uploadImageListNotifier.notifier).cancel();
                  } else {
                    ref.read(uploadImageListNotifier.notifier).upload(server!);
                  }
                },
                child: (uploading) ? const Text('Cancel') : const Text('Start upload'),
              ),
            ],
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/providers/providers.dart';

class UploadPage extends ConsumerWidget {
  const UploadPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Photon'),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Placeholder Text',
              ),
              ListView.builder(
                itemCount: ref.watch(imageListNotifier).length,
                itemBuilder:(context, index) {
                  return ListTile(
                    title: Text(
                      ref.watch(imageListNotifier)[index].name
                    )
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // TODO: manage cancel
          Navigator.pop(context);
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
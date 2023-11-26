import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/providers/providers.dart';

class UploadPage extends ConsumerWidget {
  final String serverInfos;
  
  const UploadPage({super.key, required this.serverInfos});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Upload'),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Placeholder Text',
              ),
              Text(serverInfos),
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
        child: const Icon(Icons.backpack),
      ),
    );
  }
}
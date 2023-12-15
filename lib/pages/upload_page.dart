import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/providers/providers.dart';

class UploadPage extends StatelessWidget {
  final String serverInfos;
  
  const UploadPage({super.key, required this.serverInfos});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Upload'),
      ),
      body: Consumer(
        builder:(context, ref, child) {
          final list = ref.watch(imageListerProvider);

          return list.when<Widget>(
            // Data screen
            data: (data) {
              ref.read(uploadImageListNotifier.notifier).from(data);
              return const Placeholder(
                child: Text('Data'),
              );
            },
            // Error screen
            error:(error, stackTrace) {
              return const Placeholder(
                child: Text('Error'),
              );
            },
            // Loading screen
            loading:() {
              return const Placeholder(
                child: Text('Loading'),
              );
            },
          );
        },
      ),
       /*Center(
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
      ),*/
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
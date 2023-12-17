import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/upload/screen/error_screen.dart';
import 'package:photon/pages/upload/screen/loading_screen.dart';
import 'package:photon/pages/upload/screen/upload_screen.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/providers.dart';

class UploadPage extends StatelessWidget {
  //final String serverInfos;
  
  //const UploadPage({super.key, required this.serverInfos});
  const UploadPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Upload'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
            },
            icon: const Icon(Icons.settings)
          )
        ]
      ),
      body: Consumer(
        builder:(context, ref, child) {
          final listFiles = ref.watch(imageListerProvider);

          return listFiles.when<Widget>(
            // Data screen
            data: (_) {
              return const UploadScreen();
            },
            // Error screen
            error: (error, stackTrace) {
              return const ErrorScreen();
            },
            // Loading screen
            loading: () {
              return const LoadingScreen();
            },
          );
        },
      ),
      // Remove auth
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton(
            onPressed: () { ref.read(serverInformationsProvider.notifier).state = null; },
            child: const Icon(Icons.token_outlined),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
import 'package:photon/pages/upload/screen/error_screen.dart';
import 'package:photon/pages/upload/screen/loading_screen.dart';
import 'package:photon/pages/upload/screen/upload_screen.dart';

// Providers
import 'package:photon/providers/global/providers.dart';
import 'package:photon/providers/upload/providers.dart';

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
          buildActions(context)
        ]
      ),
      body: Consumer(
        builder:(context, ref, child) {
          final logged = ref.watch(isLoggedProvider);

          if (!logged) {
            Navigator.pop(context);
          }
          
          final listFiles = ref.watch(imageListerProvider);

          return listFiles.when<Widget>(
            // Data screen
            data: (_) {
              return const UploadScreen();
            },
            // Error screen
            error: (error, stackTrace) {
              return ErrorScreen(error: error,);
            },
            // Loading screen
            loading: () {
              return const LoadingScreen();
            },
          );
        },
      ),
    );
  }
}
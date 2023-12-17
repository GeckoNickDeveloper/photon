import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/history/screen/error_screen.dart';
import 'package:photon/pages/history/screen/history_screen.dart';
import 'package:photon/pages/history/screen/loading_screen.dart';
import 'package:photon/providers/providers.dart';

class HistoryPage extends StatelessWidget {
  final String serverInfos;
  
  const HistoryPage({super.key, required this.serverInfos});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Upload'),
      ),
      body: Consumer(
        builder:(context, ref, child) {
          final listFiles = ref.watch(imageListerProvider);

          return listFiles.when<Widget>(
            // Data screen
            data: (data) {
              return const HistoryScreen();
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
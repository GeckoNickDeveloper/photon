import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/history/screen/error_screen.dart';
import 'package:photon/pages/history/screen/history_screen.dart';
import 'package:photon/pages/history/screen/loading_screen.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/providers.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
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
          final listFiles = ref.watch(historyProvider);

          return listFiles.when<Widget>(
            // Data screen
            data: (data) {
              //ref.read(historyListProvider.notifier).state = [...data];
              return HistoryScreen(list: data);
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
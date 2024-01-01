import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
import 'package:photon/pages/history/screen/error_screen.dart';
import 'package:photon/pages/history/screen/history_screen.dart';
import 'package:photon/pages/history/screen/loading_screen.dart';

// Providers
import 'package:photon/providers/global/providers.dart';
import 'package:photon/providers/history/providers.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
        actions: [
          buildActions(context)
        ]
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final logged = ref.watch(isLoggedProvider);

            if(!logged) {
              Navigator.pop(context);
            }

            final listFiles = ref.watch(historyProvider);
            return listFiles.when(
              // Data screen
              data: (data) => const HistoryScreen(),
              // Error screen
              error: (error, stackTrace) => ErrorScreen(error: error,),
              // Loading screen
              loading: () => const LoadingScreen(),
            );
          },
        ),
      ),
    );
  }
}
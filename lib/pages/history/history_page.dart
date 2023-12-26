import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/pages/history/screen/error_screen.dart';
import 'package:photon/pages/history/screen/history_screen.dart';
import 'package:photon/pages/history/screen/loading_screen.dart';
import 'package:photon/pages/settings/settings_page.dart';

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
          Consumer(
            builder:(context, ref, child) {
              final svr = ref.watch(serverInformationsProvider);
              final List<Widget> buttons = [];

              if (svr != null) {
                buttons.add(
                  IconButton(
                    onPressed: () {
                      ref.read(serverInformationsProvider.notifier).state = null;
                    },
                    icon: const Icon(Icons.token_outlined)
                  )
                );
              }

              buttons.add(
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                  },
                  icon: const Icon(Icons.settings),
                  tooltip: 'Settings',
                )
              );

              return Row(
                children: buttons,
              );
            },
          ),
        ]
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final PhotonServerModel? auth = ref.watch(serverInformationsProvider);

            if (auth == null) {
              Navigator.pop(context);
            }

            final listFiles = ref.watch(historyProvider);
      
            return listFiles.when<Widget>(
              // Data screen
              data: (data) {
                //ref.read(historyListProvider.notifier).state = [...data];
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
      ),
    );
  }
}
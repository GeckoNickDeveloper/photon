import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/global/providers.dart';
import 'package:photon/pages/home/screen/authorized_screen.dart';
import 'package:photon/pages/home/screen/unauthorized_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Photon'),
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
      body: Consumer(
        builder: (context, ref, _) {
          final PhotonServerModel? auth = ref.watch(serverInformationsProvider);

          if (auth == null) {
            return const UnauthorizedScreen();
          } else {
            return const AuthorizedScreen();
          }
        },
      ),
    );
  }
}

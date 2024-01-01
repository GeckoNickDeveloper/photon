import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_server_model.dart';
import 'package:photon/models/server.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/global/providers.dart';

// AppBar actions
Widget buildActions(BuildContext ctx, {bool toSettings = true}) {
  return Consumer(
    builder:(context, ref, _) {
      final logged = ref.read(isLoggedProvider);
      
      final List<Widget> buttons = [];

      if (logged) {
        buttons.add(
          IconButton(
            onPressed: () {
              logout(ref);
            },
            icon: const Icon(Icons.token_outlined)
          )
        );
      }

      if (toSettings) {
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
      }

      return Row(
        children: buttons,
      );
    },
  );
}

void login(WidgetRef ref, PhotonServerModel infos) {
  ref.read(isLoggedProvider.notifier).state = true;
  Server().infos = infos;
}

void logout(WidgetRef ref) {
  ref.read(isLoggedProvider.notifier).state = false;
  Server().clear();
}
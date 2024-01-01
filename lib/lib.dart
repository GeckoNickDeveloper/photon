import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/global/providers.dart';

Widget buildActions(BuildContext ctx, {bool toSettings = true}) {
  return Consumer(
    builder:(context, ref, _) {
      final logged = ref.read(isLoggedProvider);
      
      final List<Widget> buttons = [];

      if (logged) {
        buttons.add(
          IconButton(
            onPressed: () {
              ref.read(isLoggedProvider.notifier).state = false;
              ref.read(serverInformationsProvider.notifier).state = null;
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
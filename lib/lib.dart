import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

bool login(WidgetRef ref) {
  bool result = Server().commit();
  ref.read(isLoggedProvider.notifier).state = result;
  return result;
}

void logout(WidgetRef ref) {
  Server().clear();
  ref.read(isLoggedProvider.notifier).state = false;
}
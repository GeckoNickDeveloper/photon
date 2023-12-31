import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
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
          buildActions(context)
        ]
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final logged = ref.watch(isLoggedProvider);

          if (!logged) {
            return const UnauthorizedScreen();
          } else {
            return const AuthorizedScreen();
          }
        },
      ),
    );
  }
}

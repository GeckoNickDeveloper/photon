import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/providers/providers.dart';
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

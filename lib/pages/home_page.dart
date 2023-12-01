import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/pages/scan_qr_page.dart';
import 'package:photon/providers/providers.dart';
import 'package:photon/widgets/authorized_home_page.dart';
import 'package:photon/widgets/unauthorized_home_page.dart';

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
            return const UnauthorizedHomePage();
          } else {
            return const AuthorizedHomePage();
          }
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton(
            onPressed: () { ref.watch(serverInformationsProvider.notifier).state = null; },
            child: const Icon(Icons.clear_all),
          );
        },
      ),
    );
  }
}

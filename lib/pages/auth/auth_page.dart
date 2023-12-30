import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/pages/auth/screen/error_screen.dart';
import 'package:photon/pages/auth/screen/loading_screen.dart';
import 'package:photon/pages/auth/screen/registered_screen.dart';
import 'package:photon/pages/auth/screen/scanner_screen.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/auth/providers.dart';
import 'package:photon/providers/global/providers.dart';



class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Scan QR'),
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
          builder: (context, ref, _) {
            final isScanning = ref.watch(isScanningProvider);
      
            if(isScanning) {
              return ScannerScreen();
            } else {
              Scanner().unlock();
            }
    
            final reg = ref.watch(registerProvider);
            return reg.when(
              data: (_) => const RegisteredScreen(),
              error: (error, stackTrace) => const ErrorScreen(),
              loading: () => const LoadingScreen()
            );
          },
        ),
      ),
    );
  }
}
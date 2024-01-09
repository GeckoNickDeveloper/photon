import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
import 'package:photon/pages/auth/screen/error_screen.dart';
import 'package:photon/pages/auth/screen/loading_screen.dart';
import 'package:photon/pages/auth/screen/registered_screen.dart';
import 'package:photon/pages/auth/screen/scanner_screen.dart';
import 'package:photon/providers/auth/providers.dart';



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
          buildActions(context)
        ]
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final isScanning = ref.watch(isScanningProvider);
      
            if(isScanning) {
              return ScannerScreen();
            }
    
            final reg = ref.watch(registerProvider);
            return reg.when(
              data: (_) => const RegisteredScreen(),
              error: (error, stackTrace) => ErrorScreen(error: error),
              loading: () => const LoadingScreen()
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/pages/auth/auth_page.dart';
import 'package:photon/providers/auth/providers.dart';

class UnauthorizedScreen extends StatelessWidget{
  const UnauthorizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('You must scan the servers QR code in order to unleash the app features'),
        Consumer(
          builder:(context, ref, child) {
            return ElevatedButton(
              onPressed: () async {
                final status = await Permission.camera.request();
          
                if (status == PermissionStatus.granted) {
                  if (!context.mounted) return;

                  Scanner().unlock();
                  ref.read(isScanningProvider.notifier).state = true;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AuthPage(),
                    ),
                  );
                } else {
                  openAppSettings();
                }
              },
              child: const Row(
                children: [
                  Text('SCAN QR CODE'),
                  Spacer(),
                  Icon(Icons.qr_code_scanner),
                ]
              )
            );
          },
        ),
      ],
    );
  }
  
}
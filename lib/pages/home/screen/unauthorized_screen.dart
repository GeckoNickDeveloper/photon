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
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const Spacer(),
          const Text(
            'You must scan the servers QR code in order to use the app',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Consumer(
            builder:(context, ref, child) {
              return ElevatedButton(
                onPressed: () async {
                  final status = await Permission.camera.request();
            
                  if (status == PermissionStatus.granted) {
                    if (!context.mounted) return;
    
                    ref.read(isScanningProvider.notifier).state = true;
                    Scanner().unlock();
    
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
                    Text('Scan QR Code'),
                    Spacer(),
                    Icon(Icons.qr_code_scanner),
                  ]
                )
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
  
}
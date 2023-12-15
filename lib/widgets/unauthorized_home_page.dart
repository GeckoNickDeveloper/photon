import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photon/pages/auth/auth_page.dart';

class UnauthorizedHomePage extends StatelessWidget{
  const UnauthorizedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('You must scan the servers QR code in order to unleash the app features'),
        ElevatedButton(
          onPressed: () async {
            final status = await Permission.camera.request();

            if (status == PermissionStatus.granted) {
              if (!context.mounted) return;
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
        ),
      ],
    );
  }
  
}
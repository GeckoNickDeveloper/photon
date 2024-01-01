import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photon/pages/history/history_page.dart';
import 'package:photon/pages/upload/upload_page.dart';

// Providers
import 'package:photon/providers/upload/providers.dart';
import 'package:photon/providers/history/providers.dart';

class AuthorizedScreen extends StatelessWidget{
  const AuthorizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            /// UPLOAD PAGE
            ElevatedButton(
              onPressed: () async {
                // Ask permission
                var status = await Permission.manageExternalStorage.request();
                print('storage ${status.toString()}');
                if (status == PermissionStatus.denied || status == PermissionStatus.permanentlyDenied) await openAppSettings();
                //status = await Permission.accessMediaLocation.request();
                //print('media ${status.toString()}');
                //if (status == PermissionStatus.denied || status == PermissionStatus.permanentlyDenied) await openAppSettings();
                
                // List all files
                final _ = ref.refresh(imageListerProvider);

                if (!context.mounted) return;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UploadPage(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Text('Upload'),
                  Spacer(),
                  Icon(Icons.upload),
                ]
              )
            ),
            
            /// HISTORY PAGE
            ElevatedButton(
              onPressed: () async {
                // Request history
                final _ = ref.refresh(historyProvider);

                if (!context.mounted) return;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Text('History'),
                  Spacer(),
                  Icon(Icons.history),
                ]
              )
            ),
          ]
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photon/pages/scan_qr_page.dart';
import 'package:photon/pages/upload_page.dart';
import 'package:photon/services/permission_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // Build method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanQrButton = ElevatedButton(
      onPressed: () => scanQr(context, ref),
      child: const Row(
        children: [
          Text('SCAN QR CODE'),
          Spacer(),
          Icon(Icons.qr_code_scanner),
        ]
      )
    );

    final startUploadButton = ElevatedButton(
      onPressed: () => scanQr(context, ref),
      child: const Row(
        children: [
          Text('SCAN QR CODE'),
          Spacer(),
          Icon(Icons.qr_code_scanner),
        ]
      )
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Photon'),
      ),
      body: const Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Placeholder Text',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: scanQrButton,
    );
  }



  Future<void> scanQr(BuildContext context, WidgetRef ref) async {
    final permissionService = PermissionService();
    
    await permissionService.askCameraPermission();

    if (permissionService.camera == PermissionStatus.granted) {
      // ignore: use_build_context_synchronously
      final String? content = await Navigator.of(context).push<String?>(
        MaterialPageRoute(
          builder: (context) => ScanQRPage(),
        ),
      );

      print('================================================== ${content ?? "NULL"}');

      // Check result and change page
      //ref.read(qrStringContent.notifier).state = content;

      if (content != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UploadPage(serverInfos: content),
          ),
        );
      }
      // ignore: use_build_context_synchronously
      } else {
      openAppSettings();
    }
  }
}

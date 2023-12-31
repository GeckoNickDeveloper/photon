import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_server_model.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/models/server.dart';

// Providers
import 'package:photon/providers/auth/providers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({super.key});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            Expanded(
              child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(),
                onQRViewCreated: (controller) => onQRViewCreated(controller, ref),
              ),
            ),
          ],
        );
      }
    );
  }

  void onQRViewCreated(QRViewController controller, WidgetRef ref) {
    controller
      .scannedDataStream
      .listen(
        (scanData) {
          if(Scanner().locked()) return;
          Scanner().lock();

          PhotonServerModel? psm;
          try {
            psm = PhotonServerModel.fromJson(jsonString: scanData.code!);
          } on Exception {
            // No action
          }

          Server().setPending(psm);
          ref.read(isScanningProvider.notifier).state = false;
          // ignore: unused_result
          ref.refresh(registerProvider);
        }
      );
  }
}
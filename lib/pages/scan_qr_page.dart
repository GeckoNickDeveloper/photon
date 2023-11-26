import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class ScanQRPage extends StatelessWidget {
  ScanQRPage({super.key});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) => _onQRViewCreated(controller, context),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context, null);
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      Navigator.pop(context, scanData.code);
    });
  }
}
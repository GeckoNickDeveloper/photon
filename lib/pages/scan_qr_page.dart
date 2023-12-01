import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/providers/providers.dart';
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
            child: Consumer(
              builder: (context, ref, child) {
                return QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) => _onQRViewCreated(controller, context, ref),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context, WidgetRef ref) {
    controller.scannedDataStream.listen((scanData) {
      final psm = parser(scanData.code!);

      // Add Server Informations
      ref.read(serverInformationsProvider.notifier).state = psm;

      if (psm == null) {
        // Snackbar invalid QR
      }
      
      controller.dispose();
      debugPrint('========================= ${scanData.code}');
      Navigator.of(context).pop();
    });
  }

  PhotonServerModel? parser(String jsonString) {
    PhotonServerModel? psm;

    try {
      final json = jsonDecode(jsonString);
    
      final token = json['token'] as String;
      final uri = Uri.http(json['uri']);


      psm = PhotonServerModel(token: token, uri: uri);
    } on FormatException {
      psm = null;
    }
    
    return psm;
  }
}
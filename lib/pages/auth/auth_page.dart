import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/providers/providers.dart';
import 'package:photon/services/photon_api_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class AuthPage extends StatelessWidget {
  AuthPage({super.key});

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
                  overlay: QrScannerOverlayShape(),
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
    controller.scannedDataStream.listen((scanData) async {
      var psm = parser(scanData.code!);

      if (psm == null) {
        // Invalid QR Snackbar
        ScaffoldMessenger
          .of(context)
          .showSnackBar(
            const SnackBar(
              content: Text('Invalid QR. Please retry.')
            )
          );
      } else {
        try {
          await PhotonApiService().register(psm);

          if(!context.mounted) return;
          controller.dispose();
          Navigator.of(context).pop();
        } on Exception catch(e) {
          psm = null;
          
          // API Error Snackbar
          if(!context.mounted) return;
          ScaffoldMessenger
            .of(context)
            .showSnackBar(
              SnackBar(
                content: Text(e.toString()/*'Unable to register to the server. Try again in the same network'*/)
              )
            );

        } finally {
          // Update Server Informations
          ref.read(serverInformationsProvider.notifier).state = psm;
        }
      }
    });
  }

  PhotonServerModel? parser(String json) {
    PhotonServerModel? psm;

    try {
      psm = PhotonServerModel.fromJson(jsonString: json);
    } on FormatException {
      psm = null;
    }
    
    return psm;
  }
}
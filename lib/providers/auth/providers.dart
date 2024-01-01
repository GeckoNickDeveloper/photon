import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
import 'package:photon/models/server.dart';
import 'package:photon/services/photon_api_service.dart';

// Is Scanning
final isScanningProvider = StateProvider((ref) => true);

// Register
final registerProvider = FutureProvider((ref) async {
  final server = Server();

  if(server.getPending() == null) {
    throw Exception('NO PENDING SERVER');
  }
  
  final _ = await PhotonApiService().register(server.getPending()!);
  login(ref);

  return true;
});
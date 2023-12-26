import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/services/photon_api_service.dart';
// Globals providers
import 'package:photon/providers/global/providers.dart';

// Is Scanning
final isScanningProvider = StateProvider((ref) => true);

// Register
final registerProvider = FutureProvider((ref) async {
  final server = ref.read(serverInformationsProvider);

  if(server == null) {
    throw Exception('NO SERVER');
  }
  
  final _ = await PhotonApiService().register(server);

  return true;
});
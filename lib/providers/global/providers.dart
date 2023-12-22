import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';


//=============================================== Globals Providers
// Server Informations
final serverInformationsProvider = StateProvider<PhotonServerModel?>((ref) => null);

// Settings Provider
final settingsProvider = StateProvider((ref) => null);

// Device UUID
final deviceUUID = StateProvider<String?>((ref) => null);
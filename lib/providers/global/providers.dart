import 'package:flutter_riverpod/flutter_riverpod.dart';


//=============================================== Globals Providers
// Server Informations
//final serverInformationsProvider = StateProvider<PhotonServerModel?>((ref) => null);
final isLoggedProvider = StateProvider((ref) => false);

// Settings Provider
final settingsProvider = StateProvider((ref) => null);

// Device UUID
final deviceUUID = StateProvider<String?>((ref) => null);
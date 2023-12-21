import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_history_record.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/providers/upload_image_list_notifier.dart';
import 'package:photon/services/image_lister_service.dart';
import 'package:photon/services/photon_api_service.dart';


//=============================================== Globals Providers
// Server Informations
final serverInformationsProvider = StateProvider<PhotonServerModel?>((ref) => null);

// Settings Provider
final settingsProvider = StateProvider((ref) => null);

// Device UUID
final deviceUUID = StateProvider<String?>((ref) => null);
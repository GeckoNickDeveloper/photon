import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/models/image_model.dart';
import 'package:photon/providers/image_list_notifier.dart';

// Server Informations
final serverInformationsProvider = StateProvider<PhotonServerModel?>((ref) => null);

// Device UUID
final deviceUUID = StateProvider<String?>((ref) => null);

// Image list
final imageListNotifier = StateNotifierProvider<ImageListNotifier, List<ImageModel>>((ref) => ImageListNotifier([]));
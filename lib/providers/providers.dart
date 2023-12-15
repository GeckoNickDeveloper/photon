import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/providers/upload_image_list_notifier.dart';
import 'package:photon/services/image_lister_service.dart';



// Server Informations
final serverInformationsProvider = StateProvider<PhotonServerModel?>((ref) => null);

// Settings Provider
final settingsProvider = StateProvider((ref) => null);

// Device UUID
final deviceUUID = StateProvider<String?>((ref) => null);

// Image list
final imageListerProvider = FutureProvider((ref) async => ImageListerService.listAllImages());
// Si fa watch(providerName).when(
//  data: callback to build widget on data
//  error: callback to build widget on error
//  loading: callback to build widget on loading
// )

// PER RESETTARE
// ref.refresh(providerName)



//final imageListNotifier = StateNotifierProvider<ImageListNotifier, List<PhotonImage>>((ref) => ImageListNotifier([]));

// Upload page
final uploadImageListNotifier = StateNotifierProvider<UploadImageListNotifier, List<PhotonImage>>((ref) => UploadImageListNotifier([]));

final specificUploadImageProvider = ProviderFamily<PhotonImage, String>((ref, path) {
  final list = ref.watch(uploadImageListNotifier);

  return list.firstWhere((element) => element.path == path);
});
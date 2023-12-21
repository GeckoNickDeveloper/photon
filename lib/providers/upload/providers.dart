import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/providers/upload_image_list_notifier.dart';
import 'package:photon/services/image_lister_service.dart';
// Globals providers
import 'package:photon/providers/global/providers.dart';

// Image list
final imageListerProvider = FutureProvider.autoDispose((ref) async {
  final list = await ImageListerService.listAllImages();
  final tmp = list.sublist(0, 10);
  ref.watch(uploadImageListNotifier.notifier).from(tmp);
  return list;
});
// Si fa watch(providerName).when(
//  data: callback to build widget on data
//  error: callback to build widget on error
//  loading: callback to build widget on loading
// )

// PER RESETTARE
// ref.refresh(providerName)

// List notifier
final uploadImageListNotifier = StateNotifierProvider<UploadImageListNotifier, List<PhotonImage>>((ref) => UploadImageListNotifier([]));

// Family provider for single item
final specificUploadImageProvider = Provider.family<PhotonImage, String>((ref, path) {
  final list = ref.watch(uploadImageListNotifier);

  return list.firstWhere((element) => element.path == path);
});
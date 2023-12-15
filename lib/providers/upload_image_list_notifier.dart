import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/models/upload_status.dart';
import 'package:photon/services/photon_api_service.dart';

class UploadImageListNotifier extends StateNotifier<List<PhotonImage>> {
  bool uploading;
  bool cancelled;
  
  UploadImageListNotifier(super.state) : uploading = false, cancelled = false;

  int length() {
    return state.length;
  }

  void from(List<PhotonImage> newList) {
    state = [...newList];
  }

  void add(PhotonImage item) {
    final tmp = [...state];
    tmp.add(item);
    state = [...tmp];
  }

  void remove(int index) {
    final tmp = [...state];
    tmp.removeAt(index);
    state = [...tmp];
  }

  void status(int index, UploadStatus upState) {
    final tmp = [...state];
    tmp[index] = PhotonImage(name: tmp[index].name, path: tmp[index].path, file: tmp[index].file, status: tmp[index].status);//upState;
    state = [...tmp];
  }

  upload(PhotonServerModel server) async {
    if(uploading) return;
    uploading = true;

    final apiService = PhotonApiService();
    
    final len = length();
    for(var i = 0; i < len; ++i) {
      if(cancelled) {
        status(i, UploadStatus.canceled);
        continue;
      } else {
        // Manage Errors
        await Future.delayed(const Duration(milliseconds: 200));
        //await apiService.uploadImage(server, state[i]);
        status(i, UploadStatus.success);
      }
    }

    uploading = false;
    cancelled = false;
  }

  void cancel() => cancelled = true;
}
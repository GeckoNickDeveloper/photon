import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/upload_status.dart';
import 'package:photon/services/photon_api_service.dart';

class UploadImageListNotifier extends StateNotifier<List<PhotonImage>> {
  bool uploading;
  
  UploadImageListNotifier(super.state) : uploading = false;

  length() {
    return state.length;
  }

  from(List<PhotonImage> newList) {
    state = [...newList];
  }

  add(PhotonImage item) {
    final tmp = [...state];
    tmp.add(item);
    state = [...tmp];
  }

  remove(int index) {
    final tmp = [...state];
    tmp.removeAt(index);
    state = [...tmp];
  }

  status(int index, UploadStatus upState) {
    final tmp = [...state];
    tmp[index] = PhotonImage(name: tmp[index].name, path: tmp[index].path, file: tmp[index].file, status: tmp[index].status);//upState;
    state = [...tmp];
  }

  upload() async {
    if(uploading) return;
    uploading = true;

    final apiService = PhotonApiService();
    
    final tmp = [...state];
    for(var item in tmp) {
      await apiService.uploadImage(item);
    }

    uploading = false;
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/image_model.dart';
import 'package:photon/models/upload_state_model.dart';
import 'package:photon/services/photon_api_service.dart';

class UploadImageListNotifier extends StateNotifier<List<ImageModel>> {
  bool uploading;
  
  UploadImageListNotifier(super.state) : uploading = false;

  length() {
    return state.length;
  }

  add(ImageModel item) {
    final tmp = [...state];
    tmp.add(item);
    state = [...tmp];
  }

  remove(int index) {
    final tmp = [...state];
    tmp.removeAt(index);
    state = [...tmp];
  }

  status(int index, UploadStateModel upState) {
    final tmp = [...state];
    tmp[index] = ImageModel(name: tmp[index].name, path: tmp[index].path, file: tmp[index].file, state: tmp[index].state);//upState;
    state = [...tmp];
  }

  upload() async {
    if(uploading) return;
    uploading = true;

    final apiService = PhotonApiService();
    
    final tmp = [...state];
    for(var item in tmp) {
      await apiService.uploadImage(item, onSuccess: () {}, onError:(err) {},);
    }

    uploading = false;
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_image.dart';
import 'package:photon/models/data/photon_server_model.dart';
import 'package:photon/models/data/upload_status.dart';
import 'package:photon/services/photon_api_service.dart';

class UploadImageListNotifier extends StateNotifier<List<PhotonImage>> {
  bool uploading;
  bool canceled;
  int remaining;
  
  UploadImageListNotifier(super.state) : uploading = false, canceled = false, remaining = 0;

  int length() {
    return state.length;
  }

  void from(List<PhotonImage> newList) {
    remaining = newList.length;
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
    
    tmp[index] = PhotonImage(
      name: tmp[index].name,
      path: tmp[index].path,
      file: tmp[index].file,
      status: upState);

    if (upState == UploadStatus.success) {
      remaining--;
    }

    state = [...tmp];
  }

  Future<void> upload(PhotonServerModel server) async {
    if(uploading) return;
    uploading = true;

    final apiService = PhotonApiService();
    
    final len = length();
    for(var i = 0; i < len; ++i) {
      if(state[i].status == UploadStatus.success) continue;

      if(canceled) {
        status(i, UploadStatus.canceled);
        continue;
      } else {
        // Manage Errors
        //await Future.delayed(Duration(milliseconds: (Random().nextInt(10) * 100)));
        try {
          //await apiService.uploadImage(server, state[i]);
          await apiService.upload(server, state[i]);
          status(i, UploadStatus.success);
        } on Exception catch(e) {
          print(e.toString());
          status(i, UploadStatus.failed);
        }
      }
    }

    uploading = false;
    canceled = false;
  }

  void cancel() => canceled = true;
}
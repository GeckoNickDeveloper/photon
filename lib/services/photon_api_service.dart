import 'package:photon/models/device_infos.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/models/settings.dart';

class PhotonApiService {
  static PhotonApiService? _instance;

  PhotonApiService._();

  factory PhotonApiService() {
    _instance ??= PhotonApiService._();
    return _instance!;
  }
  
  // API METHODS
  Future<void> uploadImage(PhotonServerModel server, PhotonImage img) async {
    final device = DeviceInfos();
    final settings = Settings();
    
    // TODO Make api call and check for errors
    // TODO Manage errors

    if(settings.deleteOnUpload) {
      // TODO implement element delete
    }
  }

  /*
  
  uploadImages
  retrieveHistory
  auth2Api
  
  */
}
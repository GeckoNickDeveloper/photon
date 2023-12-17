import 'package:photon/models/device_infos.dart';
import 'package:photon/models/photon_history_record.dart';
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
  /// Requires authentication
  /// Upload an image to the specified photon server
  Future<void> uploadImage(PhotonServerModel server, PhotonImage img) async {
    final device = DeviceInfos();
    final settings = Settings();
    
    // TODO Make api call and check for errors
    // TODO Manage errors

    if(settings.deleteOnUpload) {
      // TODO implement element delete
    }
  }

  /// Requires authentication
  /// Retrieves a list of all the images uploaded to the specified photon server
  Future<List<PhotonHistoryRecord>> history(PhotonServerModel server) async {
    final device = DeviceInfos();
    final settings = Settings();
    final List<PhotonHistoryRecord> list = [];

    // TODO Make api call and check for errors
    // TODO Manage errors

    

    return list;
  }
  
  // Must be invoked in order to access API features
  Future<void> register(PhotonServerModel server) async {
    final device = DeviceInfos();
    final settings = Settings();
    
    // TODO Make api call and check for errors
    // TODO Manage errors
  }
}
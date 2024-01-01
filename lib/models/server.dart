import 'package:photon/models/data/photon_server_model.dart';

class Server {
  static Server? _instance;
  PhotonServerModel? infos;

  Server._() : infos = null;

  factory Server() {
    _instance ??= Server._();
    return _instance!; 
  }

  PhotonServerModel? getInfos() => null;
  void setInfos(PhotonServerModel? newInfos) => infos = newInfos;
  void clear() => setInfos(null);
}
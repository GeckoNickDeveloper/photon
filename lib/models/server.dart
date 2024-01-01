import 'package:photon/models/data/photon_server_model.dart';

class Server {
  static Server? _instance;

  PhotonServerModel? _infos;
  PhotonServerModel? _pending;

  Server._() : _infos = null, _pending = null;

  factory Server() {
    _instance ??= Server._();
    return _instance!; 
  }

  PhotonServerModel? getInfos() => _infos;
  void setInfos(PhotonServerModel? infos) => _infos = infos;
  void clear() => setInfos(null);

  PhotonServerModel? getPending() => _pending;
  void setPending(PhotonServerModel? pending) => _pending = pending;
  bool commit() {
    bool result = false;

    if (_pending != null) {
      _infos = _pending;
      _pending = null;
      result = true;
    }

    return result;
  }
}
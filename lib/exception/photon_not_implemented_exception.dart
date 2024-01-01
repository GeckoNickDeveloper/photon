import 'package:photon/exception/photon_base_exception.dart';

class PhotonNotImplementedException implements PhotonBaseException {
  String? msg;
  
  PhotonNotImplementedException({this.msg});
  
  @override
  String toString() => 'PhotonNotImplementedException: $msg';
}
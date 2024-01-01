import 'package:photon/exception/photon_base_exception.dart';

class PhotonTeapotException implements PhotonBaseException {
  String? msg;
  
  PhotonTeapotException({this.msg});
  
  @override
  String toString() => 'PhotonTeapotException: $msg';
}
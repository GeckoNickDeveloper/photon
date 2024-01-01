import 'package:photon/exception/photon_base_exception.dart';

class PhotonForbiddenException implements PhotonBaseException {
  String? msg;
  
  PhotonForbiddenException({this.msg});
  
  @override
  String toString() => 'PhotonForbiddenException: $msg';
}
import 'package:photon/exception/photon_base_exception.dart';

class PhotonBadRequestException implements PhotonBaseException {
  String? msg;
  
  PhotonBadRequestException({this.msg});
  
  @override
  String toString() => 'PhotonBadRequestException: $msg';
}
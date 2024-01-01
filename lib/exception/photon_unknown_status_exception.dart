import 'package:photon/exception/photon_base_exception.dart';

class PhotonUnknownStatusException implements PhotonBaseException {
  String? msg;
  
  PhotonUnknownStatusException({this.msg});
  
  @override
  String toString() => 'PhotonUnknownStatusException: $msg';
}
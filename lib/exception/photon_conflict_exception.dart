import 'package:photon/exception/photon_base_exception.dart';

class PhotonConflictException implements PhotonBaseException {
  String? msg;
  
  PhotonConflictException({this.msg});
  
  @override
  String toString() => 'PhotonConflictException: $msg';
}
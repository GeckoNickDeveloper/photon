class PhotonBadRequestException implements Exception {
  String? msg;
  
  PhotonBadRequestException({this.msg});
  
  @override
  String toString() => 'PhotonBadRequestException: $msg';
}
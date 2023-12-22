class PhotonUnknownStatusException implements Exception {
  String? msg;
  
  PhotonUnknownStatusException({this.msg});
  
  @override
  String toString() => 'PhotonUnknownStatusException: $msg';
}
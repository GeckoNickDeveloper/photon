class PhotonForbiddenException implements Exception {
  String? msg;
  
  PhotonForbiddenException(this.msg);
  
  @override
  String toString() => 'PhotonForbiddenException: $msg';
}
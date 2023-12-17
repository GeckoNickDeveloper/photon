class PhotonConflictException implements Exception {
  String? msg;
  
  PhotonConflictException(this.msg);
  
  @override
  String toString() => 'PhotonConflictException: $msg';
}
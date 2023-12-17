class PhotonNotImplementedException implements Exception {
  String? msg;
  
  PhotonNotImplementedException(this.msg);
  
  @override
  String toString() => 'PhotonNotImplementedException: $msg';
}
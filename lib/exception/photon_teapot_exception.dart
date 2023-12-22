class PhotonTeapotException implements Exception {
  String? msg;
  
  PhotonTeapotException({this.msg});
  
  @override
  String toString() => 'PhotonTeapotException: $msg';
}
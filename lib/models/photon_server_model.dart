import 'dart:convert';

class PhotonServerModel {
  String token;
  Uri uri;

  PhotonServerModel._({required this.token, required this.uri});

  factory PhotonServerModel({required String jsonString}) {
    final json = jsonDecode(jsonString);
    
    final token = json['token'];
    final uri = Uri.http(json['uri']);


    return PhotonServerModel._(token: token, uri: uri);
  }
}
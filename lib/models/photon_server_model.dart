import 'dart:convert';

class PhotonServerModel {
  String token;
  Uri uri;

  PhotonServerModel._({required this.token, required this.uri});

  factory PhotonServerModel.fromJSON({required String jsonString}) {
    final json = jsonDecode(jsonString);

    return PhotonServerModel._(token: json['token'], uri: json['uri']);
  }
}
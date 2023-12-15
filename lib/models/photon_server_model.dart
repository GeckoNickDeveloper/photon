import 'dart:convert';

class PhotonServerModel {
  String token;
  Uri uri;

  PhotonServerModel._({required this.token, required this.uri});

  factory PhotonServerModel.fromJson({required String jsonString}) {
    final json = jsonDecode(jsonString);

    return PhotonServerModel._(token: json['token'], uri: Uri.http(json['uri']));
  }
}
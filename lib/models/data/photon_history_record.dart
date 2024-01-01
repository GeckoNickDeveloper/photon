import 'dart:convert';

class PhotonHistoryRecord {
  String filename;
  String path;
  String date;

  PhotonHistoryRecord._({required this.filename, required this.path, required this.date});

  factory PhotonHistoryRecord.fromJson({required String jsonString}) {
    final json = jsonDecode(jsonString);

    return PhotonHistoryRecord._(filename: json['filename'], path: json['path'], date: json['date']);
  }
}
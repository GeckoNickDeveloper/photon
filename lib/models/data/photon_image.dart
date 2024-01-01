import 'dart:io';

import 'package:photon/models/data/upload_status.dart';

class PhotonImage {
  String name;
  String path;
  FileSystemEntity file;
  UploadStatus status;

  PhotonImage({required this.name, required this.path, required this.file, required this.status});
}
import 'dart:io';

import 'package:photon/models/upload_status.dart';

class ImageModel {
  final String name;
  final String path;
  final File file;
  final UploadStatus state;

  const ImageModel({required this.name, this.path = '/', required this.file, this.state = UploadStatus.pending});
}
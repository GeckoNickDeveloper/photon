import 'dart:io';

import 'package:photon/models/upload_state_model.dart';

class ImageModel {
  final String name;
  final String path;
  final File file;
  final UploadStateModel state;

  const ImageModel({required this.name, this.path = '/', required this.file, this.state = UploadStateModel.pending});
}
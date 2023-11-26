import 'dart:io';

class ImageModel {
  final String name;
  final String path;
  final File file;

  const ImageModel({required this.name, this.path = '/', required this.file});
}
import 'dart:io';

import 'package:flutter/material.dart';

class UploadImageView extends StatelessWidget {
  final FileSystemEntity file;
  
  const UploadImageView({super.key, required this.file});



  @override
  Widget build(BuildContext context) {
    final name = file.path.split('/').last;

    return ListTile(
      title: Text(name),
      subtitle:
        Row(
          children: [
            Image.file(File(file.path)),
            Text(file.path),
            const Icon(Icons.upload_file)
          ],
        ),
    );
  }
  
}
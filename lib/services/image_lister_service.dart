import 'dart:io';

import 'package:photon/models/photon_image.dart';
import 'package:photon/models/upload_status.dart';

class ImageListerService {
  static const String root = '/storage/emulated/0';
  static const List<String> blacklist = ['Android'];
  static const List<String> whitelist = ['DCIM'];

  static Future<List<PhotonImage>> listAllImages() async {
    List<PhotonImage> list = [];
    final List<FileSystemEntity> allowed = [];

    // Filter only allowed paths
    final List<FileSystemEntity> rawList = await Directory('/storage/emulated/0').list().toList();

    /*for(var i in rawList) {
      for(var j in blacklist) {
        if (!i.path.contains(j)) {
          allowed.add(i);
        }
      }
    }*/
    
    for(var i in rawList) {
      for(var j in whitelist) {
        if (i.path.contains(j)) {
          allowed.add(i);
        }
      }
    }

    // Generation of list
    for(var i in allowed) {
      var subList = await Directory(i.path).list(recursive: true).toList();
      subList = subList.where(
        (element) => 
          element.
            path.
            split('/').
            last.
            split('.').
            last == 'jpg'
        ).toList();

      for(var item in subList) {
        if (item is File) {
          final filename = item.path.split('/').last;

          list.add(PhotonImage(name: filename, path: item.path, file: item, status: UploadStatus.pending));
        }
      }
    }

    return list;
  }
}
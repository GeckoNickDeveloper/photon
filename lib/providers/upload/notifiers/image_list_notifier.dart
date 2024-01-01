import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_image.dart';

class ImageListNotifier extends StateNotifier<List<PhotonImage>> {
  ImageListNotifier(super.state);

  length() {
    return state.length;
  }

  add(PhotonImage item) {
    final tmp = [...state];
    tmp.add(item);
    state = [...tmp];
  }

  remove(int index) {
    final tmp = [...state];
    tmp.removeAt(index);
    state = [...tmp];
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/image_model.dart';

class ImageListNotifier extends StateNotifier<List<ImageModel>> {
  ImageListNotifier(super.state);

  length() {
    return state.length;
  }

  add(ImageModel item) {
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
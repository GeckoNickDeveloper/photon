import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/models/upload_status.dart';
import 'package:photon/pages/upload/widget/upload_tile.dart';

// Providers
import 'package:photon/providers/global/providers.dart';
import 'package:photon/providers/upload/providers.dart';


class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final server = ref.watch(serverInformationsProvider);
        final uploading = ref.watch(uploadImageListNotifier.notifier).uploading;
        final list = ref.watch(uploadImageListNotifier);

        if(server == null) {
          Navigator.pop(context);
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder:(context, index) {
                    return UploadTile(id: list[index].path);
                  },
                ),
              ),
              elevatedButton(context, ref, server!, list, uploading),
            ],
          ),
        );
      },
    );
  }

  Widget elevatedButton(BuildContext ctx, WidgetRef ref, PhotonServerModel server, List<PhotonImage> list, bool uploading) {
    final remaining = list.where((element) => element.status != UploadStatus.success).toList().length;
    final text = (uploading) ? const Text('Cancel') : ((remaining != 0) ? const Text('Upload') : const Text('Back'));

    return ElevatedButton(
      onPressed: () {
        if(uploading) {
          ref.read(uploadImageListNotifier.notifier).cancel();
        } else if (remaining != 0) {
          ref.read(uploadImageListNotifier.notifier).upload(server);
        } else {
          Navigator.pop(ctx);
        }
      },
      child: text,
    );
  }
}
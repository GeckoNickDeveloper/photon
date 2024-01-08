import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_image.dart';
import 'package:photon/models/data/photon_server_model.dart';
import 'package:photon/models/server.dart';
import 'package:photon/pages/upload/widget/upload_tile.dart';

// Providers
import 'package:photon/providers/upload/providers.dart';


class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final uploading = ref.watch(uploadImageListNotifier.notifier).uploading;
        final list = ref.watch(uploadImageListNotifier);

        return Center(
          child:
            (list.isEmpty) ?
            emptyListBuilder() :
            listBuilder(context, ref, uploading, list)
        );
      },
    );
  }

  Widget elevatedButton(BuildContext ctx, WidgetRef ref, PhotonServerModel server, List<PhotonImage> list, bool uploading) {
    final remaining = ref.watch(uploadImageListNotifier.notifier).remaining;
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

  // List view
  Widget emptyListBuilder() => const Text('Nothing to Upload');

  Widget listBuilder(BuildContext ctx, WidgetRef ref, bool uploading, List<PhotonImage> list) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) => 
                UploadTile(id: '${list[index].path}/${list[index].name}'),
              separatorBuilder: (context, index) =>
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0
                  ),
                  child: Divider(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: elevatedButton(ctx, ref, Server().getInfos()!, list, uploading),
        ),
      ],
    );
}
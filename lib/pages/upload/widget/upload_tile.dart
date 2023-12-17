import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/upload_status.dart';
import 'package:photon/providers/providers.dart';

class UploadTile extends StatelessWidget {
  final String id;
  
  const UploadTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:(context, ref, _) {
        final item = ref.watch(specificUploadImageProvider(id));

        var icon = const Icon(Icons.pending);
        switch (item.status) {
          case UploadStatus.canceled:
            icon = const Icon(Icons.cancel);
            break;
          case UploadStatus.success:
            icon = const Icon(Icons.check);
            break;
          case UploadStatus.pending:
            icon = const Icon(Icons.autorenew);
            break;
          case UploadStatus.failed:
            icon = const Icon(Icons.warning);
            break;
        }

        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.path),
          trailing: icon,
        );
      },
    );
  }
  
}
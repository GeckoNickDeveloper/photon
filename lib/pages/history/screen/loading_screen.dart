import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/upload/widget/upload_tile.dart';

// Providers
import 'package:photon/providers/global/providers.dart';
import 'package:photon/providers/upload/providers.dart';
import 'package:photon/providers/history/providers.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final server = ref.watch(serverInformationsProvider);
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
            ],
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/upload_page.dart';
import 'package:photon/providers/providers.dart';

class AuthorizedHomePage extends StatelessWidget{
  const AuthorizedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder:(context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                // Ask permission
                final _ = ref.refresh(imageListerProvider);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UploadPage(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Text('Upload'),
                  Spacer(),
                  Icon(Icons.upload),
                ]
              )
            );
          },
        ),
        ElevatedButton(
          onPressed: () => { },
          child: const Row(
            children: [
              Text('History'),
              Spacer(),
              Icon(Icons.history),
            ]
          )
        ),
      ]
    );
  }
  
}
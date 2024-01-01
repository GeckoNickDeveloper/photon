import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';
import 'package:photon/models/device_infos.dart';
import 'package:photon/models/settings.dart';
import 'package:photon/providers/global/providers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool deleteOnUpload = Settings().deleteOnUpload;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Settings'),
        actions: [
          buildActions(context, toSettings: false)
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Delete images after upload:'),
            Switch(
              value: deleteOnUpload,
              onChanged: (value) {
                setState(() {
                  Settings().updateDeleteOnUpload(value);
                  deleteOnUpload = value;
                });
              }
            ),
            Text('UUID: ${DeviceInfos().uuid!}'),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:photon/lib.dart';
import 'package:photon/models/data/device_infos.dart';
import 'package:photon/models/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool deleteOnUpload = Settings().deleteOnUpload;
  bool specifyPath = Settings().specifyPath;
  
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
          children: <Widget>[
            ListTile(
              title: const Text('Delete after upload:'),
              trailing: Switch(
                value: deleteOnUpload,
                onChanged: (value) {
                  setState(() {
                    Settings().updateDeleteOnUpload(value);
                    deleteOnUpload = value;
                  });
                }
              ),
            ),
            ListTile(
              title: const Text('Specify path:'),
              trailing: Switch(
                value: specifyPath,
                onChanged: (value) {
                  setState(() {
                    Settings().updateSpecifyPath(value);
                    specifyPath = value;
                  });
                }
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 0.0,
                bottom: 32.0
              ),
              child: Column(
                children: [
                  const Text('UUID'),
                  Text(DeviceInfos().uuid!)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings Page placeholder text:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() { },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  } 
}
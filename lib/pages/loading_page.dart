import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/pages/home_page.dart';
import 'package:photon/pages/test_page.dart';
import 'package:photon/providers/providers.dart';
import 'package:photon/services/local_storage_service.dart';
import 'package:photon/services/permission_service.dart';
import 'package:uuid/uuid.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setup(context, ref);

    // It should be nice to insert a brief animation
    return const Center(
      child: Icon(Icons.air),
    );
  }
  
  Future<void> setup(BuildContext context, WidgetRef ref) async {
    final localStorageService = LocalStorageService();
    
    var uuid = await localStorageService.readUUID();
    uuid ??= const Uuid().v8();
    await localStorageService.writeUUID(uuid);

    await PermissionService().update();
    
    // Update State
    ref.read(deviceUUID.notifier).state = uuid;
    final _ = ref.refresh(imageListerProvider);

    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        //builder: (context) => const HomePage()
        builder: (context) => const TestPage()
      ),
      (route) => false
    );
  }
}
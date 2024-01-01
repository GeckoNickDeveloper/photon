import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/providers/global/providers.dart';  // Globals providers

import 'package:photon/models/data/photon_history_record.dart';
import 'package:photon/services/photon_api_service.dart';

// Request history to the server
final historyProvider = FutureProvider.autoDispose((ref) async {
  final server = ref.read(serverInformationsProvider);
  
  if (server == null) {
    throw Exception('SERVER NULLO');
  }
  
  final list = await PhotonApiService().history(server);
  ref.read(historyListProvider.notifier).state = list;

  return list;
});

// List to display
final historyListProvider = StateProvider<List<PhotonHistoryRecord>>((ref) => []);
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/server.dart';
import 'package:photon/providers/global/providers.dart';  // Globals providers

import 'package:photon/models/data/photon_history_record.dart';
import 'package:photon/services/photon_api_service.dart';

// Request history to the server
final historyProvider = FutureProvider.autoDispose((ref) async {
  final logged = ref.read(isLoggedProvider);
  
  if (!logged) {
    throw Exception('SERVER NULLO');
  }
  
  final list = await PhotonApiService().history(Server().infos!);
  ref.read(historyListProvider.notifier).state = list;

  return list;
});

// List to display
final historyListProvider = StateProvider<List<PhotonHistoryRecord>>((ref) => []);
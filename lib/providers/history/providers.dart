import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/providers/global/providers.dart';  // Globals providers

import 'package:photon/models/photon_history_record.dart';
import 'package:photon/services/photon_api_service.dart';

// Request history to the server
final historyProvider = FutureProvider.autoDispose((ref) async {
  final list = await PhotonApiService().history(ref.read(serverInformationsProvider)!);
  return list;
});

// List to display
final historyListProvider = StateProvider<List<PhotonHistoryRecord>>((ref) => []);
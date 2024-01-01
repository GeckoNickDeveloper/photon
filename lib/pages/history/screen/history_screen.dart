import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_history_record.dart';

// Providers
import 'package:photon/providers/global/providers.dart';
import 'package:photon/providers/history/providers.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final server = ref.watch(serverInformationsProvider);
        final list = ref.watch(historyListProvider);

        if(server == null) {
          Navigator.pop(context);
        }

        return (list.isEmpty) ? emptyListBuilder() : listBuilder(list);
      },
    );
  }


  // Nothing to display
  Widget emptyListBuilder() => const Text('Nothing to display');

  // Display list
  Widget listBuilder(List<PhotonHistoryRecord> list) => 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder:(context, index) {
              return ListTile(
                title: Text(list[index].filename),
                subtitle: Text(list[index].date),
              );
            },
          ),
        ),
      ],
    );
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/photon_history_record.dart';

// Providers
import 'package:photon/providers/history/providers.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final list = ref.watch(historyListProvider);

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
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder:(context, index) =>
              ListTile(
                title: Text(list[index].filename),
                subtitle: Text(list[index].date),
              ),
            separatorBuilder: (context, index) =>
              const Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0
                ),
                child: Divider(),
              ),
          ),
        ),
      ],
    );
}
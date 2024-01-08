import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/server.dart';
import 'package:photon/pages/settings/settings_page.dart';
import 'package:photon/providers/global/providers.dart';
import 'package:http/http.dart';
import 'package:photon/exception/photon_bad_request_exception.dart';
import 'package:photon/exception/photon_base_exception.dart';
import 'package:photon/exception/photon_conflict_exception.dart';
import 'package:photon/exception/photon_forbidden_exception.dart';
import 'package:photon/exception/photon_not_implemented_exception.dart';
import 'package:photon/exception/photon_teapot_exception.dart';
import 'package:photon/exception/photon_unknown_status_exception.dart';

// AppBar actions
Widget buildActions(BuildContext ctx, {bool toSettings = true}) {
  return Consumer(
    builder:(context, ref, _) {
      final logged = ref.watch(isLoggedProvider);
      
      final List<Widget> buttons = [];

      if (logged) {
        buttons.add(
          IconButton(
            onPressed: () {
              logout(ref);
            },
            icon: const Icon(Icons.token_outlined),
            tooltip: 'Logout',
          )
        );
      }

      if (toSettings) {
        buttons.add(
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
            },
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
          )
        );
      }

      return Row(
        children: buttons,
      );
    },
  );
}

bool login(Ref ref) {
  bool result = Server().commit();
  ref.read(isLoggedProvider.notifier).state = result;
  return result;
}

void logout(WidgetRef ref) {
  Server().clear();
  ref.read(isLoggedProvider.notifier).state = false;
}

String getCustomMessageFromError(Object error) {
  String text = '';
  
  if (error is PhotonBaseException) {
    if (error is PhotonBadRequestException) {
      text = 'Bad Request';
    } else if (error is PhotonForbiddenException) {
      text = 'Unauthorized. Login by scanning the QR and retry.';
    } else if (error is PhotonConflictException) {
      text = 'Device not paired. Login by scanning the QR and retry.';
    } else if (error is PhotonTeapotException) {
      text = 'Teapot';
    } else if (error is PhotonNotImplementedException) {
      text = 'Not Implemented';
    } else if (error is PhotonUnknownStatusException) {
      text = 'Unknown Status';
    }
  } else if (error is ClientException) {
    text = 'An error occured with the client. Check network connectivity and be assured to be on the same network.';
  } else if (error is TimeoutException) {
    text = 'A timeout occured. Try to operate on a different network (must be the same of the server)';
  } else {
    text = 'Something went horribly wrong...';
  }

  return text;
}
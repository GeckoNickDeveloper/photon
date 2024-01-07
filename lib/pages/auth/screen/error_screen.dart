import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:photon/exception/photon_bad_request_exception.dart';
import 'package:photon/exception/photon_base_exception.dart';
import 'package:photon/exception/photon_conflict_exception.dart';
import 'package:photon/exception/photon_forbidden_exception.dart';
import 'package:photon/exception/photon_not_implemented_exception.dart';
import 'package:photon/exception/photon_teapot_exception.dart';
import 'package:photon/exception/photon_unknown_status_exception.dart';
import 'package:photon/models/scanner.dart';
import 'package:photon/providers/auth/providers.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;
  
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:(context, ref, child) {
        String text = '';
    
        if (error is PhotonBaseException) {
          if (error is PhotonBadRequestException) {
            text = 'Bad Request';
          } else if (error is PhotonForbiddenException) {
            text = 'Forbidden';
          } else if (error is PhotonConflictException) {
            text = 'Conflict';
          } else if (error is PhotonTeapotException) {
            text = 'Teapot';
          } else if (error is PhotonNotImplementedException) {
            text = 'Not Implemented';
          } else if (error is PhotonUnknownStatusException) {
            text = 'Unknown Status';
          }
        } else if (error is ClientException) {
          text = 'An error occured with the client. Check network connectivity and be assured to be on the same network.';
        } else {
          text = 'Something went horribly wrong...';
        }
        
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Scanner().unlock();
                  ref.read(isScanningProvider.notifier).state = true;
                },
                child: const Text('Retry')
              )
            ],
          ),
        );
      },
    );
  }
}
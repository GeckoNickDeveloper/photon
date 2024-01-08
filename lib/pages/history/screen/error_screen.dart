import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photon/exception/photon_bad_request_exception.dart';
import 'package:photon/exception/photon_base_exception.dart';
import 'package:photon/exception/photon_conflict_exception.dart';
import 'package:photon/exception/photon_forbidden_exception.dart';
import 'package:photon/exception/photon_not_implemented_exception.dart';
import 'package:photon/exception/photon_teapot_exception.dart';
import 'package:photon/exception/photon_unknown_status_exception.dart';
import 'package:photon/widgets/back_home_elevated_button.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;
  
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
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
      text = 'Unknown Exception';
    }
    
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Spacer(),
            (error is PhotonForbiddenException) ?
              const BackHomeElevatedButton(logoutOnPress: false,) :
              const BackHomeElevatedButton(logoutOnPress: true,)
          ],
        )
      ),
    );
  }
}
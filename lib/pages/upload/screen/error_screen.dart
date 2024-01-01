import 'package:flutter/material.dart';
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
    } else {
      text = 'Unknown Exception';
    }
    
    return Center(
      child: Column(
        children: [
          Text(text),
          const BackHomeElevatedButton()
        ],
      )
    );
  }
}
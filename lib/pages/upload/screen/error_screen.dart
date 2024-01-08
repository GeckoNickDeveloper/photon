import 'package:flutter/material.dart';
import 'package:photon/lib.dart';
import 'package:photon/widgets/back_home_elevated_button.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;
  
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    String text = getCustomMessageFromError(error);
    
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
            const BackHomeElevatedButton(logoutOnPress: false,),
            const BackHomeElevatedButton(logoutOnPress: true,)
          ],
        )
      ),
    );
  }
}
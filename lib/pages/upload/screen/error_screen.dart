import 'package:flutter/material.dart';
import 'package:photon/widgets/back_home_elevated_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('error'),
          BackHomeElevatedButton()
        ],
      )
    );
  }
}
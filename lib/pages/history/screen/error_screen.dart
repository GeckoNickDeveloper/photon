import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/widgets/back_home_elevated_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return const Column(
          children: [
            Text('An error occured'),
            BackHomeElevatedButton()
          ],
        );
      },
    );
  }
}
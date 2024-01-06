import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/lib.dart';

class BackHomeElevatedButton extends StatelessWidget {
  final bool logoutOnPress;
  
  const BackHomeElevatedButton({super.key, this.logoutOnPress = false});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ElevatedButton(
          onPressed: () {
            //Navigator.pop(context);
            
            if (!logoutOnPress) {
              Navigator.pop(context);
            } else {
              logout(ref);
            }
          },
          child: Text((logoutOnPress) ? 'Logout' : 'Back to Home Page')
        );
      },
    );
  }

}
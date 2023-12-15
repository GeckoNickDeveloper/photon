import 'package:flutter/material.dart';

class AuthorizedHomePage extends StatelessWidget{
  const AuthorizedHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () =>  { },
          child: const Row(
            children: [
              Text('Upload'),
              Spacer(),
              Icon(Icons.upload),
            ]
          )
        ),
        ElevatedButton(
          onPressed: () => { },
          child: const Row(
            children: [
              Text('History'),
              Spacer(),
              Icon(Icons.history),
            ]
          )
        ),
      ]
    );
  }
  
}
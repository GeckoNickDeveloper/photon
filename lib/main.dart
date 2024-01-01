import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photon/models/data/device_infos.dart';
import 'package:photon/models/settings.dart';
import 'package:photon/pages/home/home_page.dart';
//import 'package:photon/pages/loading_page.dart';

void main() async {
  // Mandatory for assuring flutter innitialization
  WidgetsFlutterBinding.ensureInitialized();

  // Only vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  // Async Init
  await DeviceInfos().init();
  await Settings().init();

  // Actual App
  runApp(const ProviderScope(child: MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
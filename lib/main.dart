import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:my_startup/ui/screens/overview/overview.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XF5F5F5F5),
        primarySwatch: Colors.blue,
      ),
      home: const Overview(),
    );
  }
}

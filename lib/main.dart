import 'package:easy_tutor/screens/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter_navigation_sample",
      theme: ThemeData(primarySwatch: Colors.pink),
      // home: user_dashboard()));
      home: MainScreen()));
}

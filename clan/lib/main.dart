import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clan/ui_components/pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: "Clan",
      initialRoute: '/',
      routes: {
        '/': (context) => ClanApp(),
      }
  ));
}


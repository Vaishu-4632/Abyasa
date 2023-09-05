import 'package:abhyasa/Screens/IntroScreen.dart';
import 'package:abhyasa/Screens/Introduction.dart';
import 'package:abhyasa/Screens/create_palylist.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Introduction(),
    routes:  {
        '/playlist': (context) => CreatePlaylist(),
      },
      );
    
    
  }
}
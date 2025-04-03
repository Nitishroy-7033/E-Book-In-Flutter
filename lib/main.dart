import 'package:e_book/Config/Theme.dart';
import 'package:e_book/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_book/Pages/welcomePage.dart';
import 'package:get/get.dart';
import 'Pages/SplashPage/SplashScreen.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      //options:FirebaseOptions(apiKey: apiKey, appId: appId, messagingSenderId: messagingSenderId, projectId: projectId)
   );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  //Humne yaha getX ka dependency liya hai isliye GETMATERIALAPP use kr rhe hai
      debugShowCheckedModeBanner: false,
      title: 'E BOOK',
      theme: lightTheme,
      //home: Welcomepage(),
      home: Splashscreen(),
    );
  }
}




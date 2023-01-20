import 'package:app_6/constants.dart';
import 'package:app_6/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    //essas configurações podem ser encontradas no arquivo google services.json
      options: FirebaseOptions(
        apiKey: 'AIzaSyBBzh2Y2UJfSHVBUPbEe3AEZWxfKM5cVtY',
        appId: '1:315224880537:android:ff1c81414781f095bf0f08 ', 
        //esse atributo é encontrado no cloud messaging no campo id do remetente
        messagingSenderId:'315224880537',
        projectId: 'loja-app6')
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     Constants consta = Constants();
    return MaterialApp(
      title: "Loja de Roupas",
      theme: ThemeData(
        primarySwatch: consta.getCorAppBar as MaterialColor,
        primaryColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

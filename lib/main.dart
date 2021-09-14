import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:game/providers/login_provider.dart';
import 'package:game/screens/home.dart';
import 'package:game/screens/login.dart';
import 'package:game/screens/quiz_start.dart';
import 'package:game/screens/signup.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Game Project',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Login(),
          routes: {
            Login.routeName: (context) => Login(),
            SignUp.routeName: (context) => SignUp(),
            Home.routeName: (context) => Home(),
            QuizStart.routeName: (context)=> QuizStart()
          }),
    );
  }
}

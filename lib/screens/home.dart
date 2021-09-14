import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game/screens/login.dart';
import 'package:game/widgets/loggedInWidget.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
            return LoggedInWidget();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:game/providers/login_provider.dart';
import 'package:game/widgets/global.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
          leading: Container(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final loginProvider =
                Provider.of<LoginProvider>(context, listen: false);
            loginProvider.logout();
          },
          label: Row(
            children: [
              Text("Logout"),
              SizedBox(
                width: size.width * 0.03,
              ),
              Icon(
                Icons.logout,
                size: 20,
              )
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20, bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameSection(
                    userName: user.displayName!,
                    userProfileImage: user.photoURL!,
                    wish: "Welcome"),
                SizedBox(height: size.height * 0.02),
                Divider(),
                SizedBox(height: size.height * 0.02),
                Center(
                  child: quizForYou(),
                ),
                SizedBox(height: size.height * 0.02),
                PlayQuiz(),
                SizedBox(height: size.height * 0.06),
                ScoreSection()
              ],
            ),
          ),
        ));
  }
}

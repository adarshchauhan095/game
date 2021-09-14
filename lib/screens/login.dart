import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/providers/login_provider.dart';
import 'package:game/screens/home.dart';
import 'package:game/screens/signup.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static String routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Container(
                      width: size.width * 0.4,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "LOGO",
                          style: TextStyle(
                              letterSpacing: size.width * 0.03,
                              fontWeight: FontWeight.w600,
                              fontSize: 26),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          label: Text("Email")),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        label: Text("Password"),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("login");
                      },
                      child: Card(
                        elevation: 6,
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Or",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final loginProvider =
                            Provider.of<LoginProvider>(context, listen: false);
                        await loginProvider.googleSignin();
                        if (loginProvider.googleLogin != null) {
                          Navigator.of(context).pushNamed(Home.routeName);
                        }
                      },
                      child: Card(
                        elevation: 6,
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                "SignIn with Google",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignUp.routeName);
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.grey),
                          text: 'Don\'t have an account? ',
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Signup',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

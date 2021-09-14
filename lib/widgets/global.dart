import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:game/screens/quiz_start.dart';

Widget text(
  String? text, {
  var fontSize = 16.0,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor ?? Colors.grey,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

Widget logoutIcon() {
  return Container(
    margin: EdgeInsets.only(left: 10),
    padding: EdgeInsets.only(left: 10, top: 5, right: 15),
    child: Icon(Icons.logout, size: 30, color: Colors.black),
  );
}

Widget nameSection({String? wish, String? userName, String? userProfileImage}) {
  return Container(
    margin: EdgeInsets.only(left: 16.0, right: 16.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$wish',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '$userName',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 15.0),
              child: InkWell(
                onTap: () {},
                child: ClipOval(
                    child: Image.network(
                  userProfileImage!,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fill,
                )),
              ),
            ),
            Positioned(
              left: 9.0,
              top: 0,
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget quizForYou() {
  return Container(
    margin: EdgeInsets.only(left: 16.0, right: 16.0),
    child: Text('Here is a new Quiz for you!',
        style: TextStyle(fontSize: 16.0, color: Colors.orange)),
  );
}

class PlayQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  width: size.width / 6.5,
                  height: size.width / 6.5,
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.games,
                  )),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text("Play Now", textColor: Colors.black54, fontSize: 14.0),
                  text(
                    "10 Questions",
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          quizButton(
              textContent: "Begin",
              onPressed: () {
                Navigator.of(context).pushNamed(QuizStart.routeName);
              })
        ],
      ),
    );
  }
}

class quizButton extends StatefulWidget {
  var textContent;

  //   var icon;
  VoidCallback onPressed;

  quizButton({
    required this.textContent,
    required this.onPressed,
    //   required this.icon,
  });

  @override
  quizButtonState createState() => quizButtonState();
}

class quizButtonState extends State<quizButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: text(widget.textContent,
                    textColor: Colors.white, textAllCaps: false),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.lightBlue),
                  width: 35.0,
                  height: 35.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class ScoreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.blue)),
            width: size.width / 3.5,
            height: size.width / 3.5,
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: text("0", fontSize: 34.0, textColor: Colors.black)),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "Your Average Score!",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

Widget quizCardSelection(var option, var option1, onPressed) {
  return InkWell(
    onTap: () {
      onPressed();
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      width: 320,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: text(option1, textColor: Colors.grey),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: text(option, textColor: Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget stepIndicator(initialVal) {
  return Column(children: [
    Text("Steps Completed"),
    SizedBox(
      height: 25,
    ),
    LinearProgressIndicator(
      value: initialVal,
      backgroundColor: Colors.grey.withOpacity(0.1),
      valueColor: AlwaysStoppedAnimation(Colors.green),
    )
  ]);
}

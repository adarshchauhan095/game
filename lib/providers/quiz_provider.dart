import 'package:flutter/foundation.dart';
import 'package:game/models/quizmodel.dart';
import 'package:http/http.dart' as http;

class QuizProvider extends ChangeNotifier {
  
  var questionList = List<dynamic>.empty(growable: true);

  fetchAllQuestions() async {
    try {
      final response = await http.get(Uri.parse(
          "https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString.toString());
       questionList = quizModelFromJson(jsonString).results;
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

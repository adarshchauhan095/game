// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
    QuizModel({
        required this.responseCode,
        required this.results,
    });

    int responseCode;
    List<Result> results;

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        responseCode: json["response_code"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.category,
        required this.type,
        required this.difficulty,
        required this.question,
        required this.correctAnswer,
        required this.incorrectAnswers,
    });

    Category category;
    Type type;
    Difficulty difficulty;
    String question;
    String correctAnswer;
    List<String> incorrectAnswers;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: categoryValues.map[json["category"]]!,
        type: typeValues.map[json["type"]]!,
        difficulty: difficultyValues.map[json["difficulty"]]!,
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
    };
}

enum Category { SCIENCE_COMPUTERS }

final categoryValues = EnumValues({
    "Science: Computers": Category.SCIENCE_COMPUTERS
});

enum Difficulty { EASY }

final difficultyValues = EnumValues({
    "easy": Difficulty.EASY
});

enum Type { MULTIPLE }

final typeValues = EnumValues({
    "multiple": Type.MULTIPLE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

   EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}

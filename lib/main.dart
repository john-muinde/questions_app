// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import "package:first_app/quiz.dart";
import "package:first_app/results.dart";
import "package:flutter/material.dart";

import "./question.dart";
import "./answer.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionsIndex = 0;
  var _questions = const [
    {
      "questionText": "What is your friends name",
      "answers": [
        {"text": "Ann", "score": 3},
        {"text": "Grace", "score": 1},
        {"text": "Faith", "score": 5},
        {"text": "John", "score": 12}
      ],
    },
    {
      "questionText": "What is your favorite animal",
      "answers": [
        {"text": "Rabbits", "score": 7},
        {"text": "Dogs", "score": 11},
        {"text": "Chicken", "score": 10},
        {"text": "Hens", "score": 8}
      ],
    },
    {
      "questionText": "What are you",
      "answers": [
        {"text": "Human", "score": 10},
        {"text": "Robot", "score": 9},
        {"text": "AI", "score": 11},
        {"text": "Animal", "score": 1}
      ],
    },
  ];
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionsIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
    print(_questionsIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My appbar"),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionsIndex: _questionsIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}

import 'package:quiz_app/model/question.dart';

List<Questions> questionsList = [
  Questions(question: "Who created Flutter?", answers: {
    "Meta/Facebook": false,
    "Google": true,
    "Netflix": false,
    "Amazon": false
  }),
  Questions(
      question: "Which programing language is used by Flutter?",
      answers: {"C++": false, "Kotlin": false, "Swift": false, "Dart": true}),
  Questions(question: "Why is Flutter used?", answers: {
    "Mobile Application Development": false,
    "Web Application Development": false,
    "Desktop Application Development": false,
    "All of above": true
  }),
  Questions(question: "Who created Dart programing language?", answers: {
    "Lars Bak and Kasper Lund": true,
    "Brendan Eich": false,
    "Bjarne Stroustrup": false,
    "Jeremy Ashkenas": false
  }),
  Questions(
      question:
          "Is native app development experience required prior to flutter development?",
      answers: {"No": false, "Yes": true})
];

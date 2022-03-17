import 'dart:convert';

import 'package:flutter/foundation.dart';

class Questions {
  String question;
  Map<String, bool> answers;
  Questions({
    required this.question,
    required this.answers,
  });

  Questions copyWith({
    String? question,
    Map<String, bool>? answers,
  }) {
    return Questions(
      question: question ?? this.question,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'Answers': answers,
    };
  }

  factory Questions.fromMap(Map<String, dynamic> map) {
    return Questions(
      question: map['question'] ?? '',
      answers: Map<String, bool>.from(map['Answers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Questions.fromJson(String source) => Questions.fromMap(json.decode(source));

  @override
  String toString() => 'Questions(question: $question, Answers: $answers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Questions &&
      other.question == question &&
      mapEquals(other.answers, answers);
  }

  @override
  int get hashCode => question.hashCode ^ answers.hashCode;
}

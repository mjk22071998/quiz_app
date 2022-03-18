import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isPressed = false;
  Color byDefault = Colors.green;
  Color right = Colors.blue;
  Color wrong = Colors.red;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  isPressed = false;
                });
              },
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Question: ${index + 1}/${questionsList.length}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: 8,
                      thickness: 2.0,
                      color: Colors.grey.shade700,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        questionsList[index].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    for (int i = 0;
                        i < questionsList[index].answers.length;
                        i++)
                      ElevatedButton(
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                  if (questionsList[index]
                                      .answers
                                      .values
                                      .toList()[i]) {
                                    score += 10;
                                  }
                                });
                              },
                        style: ElevatedButton.styleFrom(
                            primary: isPressed
                                ? questionsList[index]
                                        .answers
                                        .values
                                        .toList()[i]
                                    ? right
                                    : wrong
                                : byDefault),
                        child: Text(
                          questionsList[index].answers.entries.toList()[i].key,
                        ),
                      ),
                    TextButton(
                        onPressed: isPressed
                            ? (index + 1 == questionsList.length)
                                ? () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Results"),
                                            content: Text("Your score is $score"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("OK"))
                                            ],
                                          );
                                        });
                                  }
                                : () {
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.linear);
                                  }
                            : () {},
                        child: Text((index + 1 == questionsList.length)
                            ? "See Result"
                            : "Next Question"))
                  ],
                );
              },
              itemCount: questionsList.length,
            ),
          ),
        ));
  }
}

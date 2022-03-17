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
                        onPressed: () {},
                        child: Text(
                          questionsList[index].answers.entries.toList()[i].key,
                        ),
                      ),
                    TextButton(onPressed: (){} ,child: const  Text("Next Question"))
                  ],
                );
              },
              itemCount: questionsList.length,
            ),
          ),
        ));
  }
}

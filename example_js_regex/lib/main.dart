import 'dart:convert';

import 'package:nlp/src/regular_expressions/js_regexp.dart';
import 'package:flutter/material.dart';

import 'package:nlp/nlp.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _runNlpExample() {
    // const phrase = "It happened when the baby was only ten months old";
    // const phrase = "I'll leave for 3h";
    const phrase = "The project estimative is a 2 ys duration";
    // const phrase = "We've been in Pakistan for 2ys";
    // const phrase = "I'll leave for 1 year 1 month 21 days";
    // const phrase = "I'll leave for 2 days 1 month";

    // Datetime recognizer This model will find any Date even if its write in colloquial language
    // E.g "I'll go back 8pm today" will return "2017-10-04 20:00:00"
    final results = DateTimeRecognizer.recognizeDateTime(phrase);

    print("I found the following entities (${results.length})");
    for (final result in results) {
      print("Type: ${result.typeName}");
      print(
        const JsonEncoder.withIndent("  ").convert(result.toJson()),
      );
    }
  }

  void _runRegExp() {
    print("-------- RUNNING DART VERSION --------");
    print("");

    final dartResult = JsRegExp(
      '^(?<timestamp>\\d+),(?<author>.+)\$',
      d: true,
    ).exec("1560979912,Caroline");
    if (dartResult == null) {
      print("No results");
      print("");
      return;
    }

    print("Timestamp group:");
    print(dartResult.groups['timestamp']);
    print("");

    print("Author group:");
    print(dartResult.groups['author']);
    print("");

    print("Indices:");
    print(dartResult.indices);
    print("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runNlpExample,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

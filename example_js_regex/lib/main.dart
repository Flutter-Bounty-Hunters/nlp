import 'dart:convert';

import 'package:nlp/src/regular_expressions/js_regexp.dart';
import 'package:flutter/material.dart';

import 'package:nlp/nlp.dart';
import 'package:super_editor/super_editor.dart';

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
  final _inputTextController = TextEditingController();
  AttributedText? _output;

  @override
  void dispose() {
    _inputTextController.dispose();
    super.dispose();
  }

  void _runNlpExample() {
    // const phrase = "It happened when the baby was only ten months old";
    // const phrase = "I'll leave for 3h";
    //const phrase = "The project estimative is a 2 ys duration";
    // const phrase = "We've been in Pakistan for 2ys";
    // const phrase = "I'll leave for 1 year 1 month 21 days";
    // const phrase = "I'll leave for 2 days 1 month";
    const phrase = "Send a birthday card to Dad every year on May 3rd";
    //const phrase = "Change Tires on Car next Tuesday at 5pm";

    final res = GlobalRecognizer.recognize(phrase);

    for (final item in res) {
      print(item.toJson());
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

  // I want twenty meters of cable for tomorrow
  // I'll be available tomorrow from 11am to 2pm to receive up to 5kg of sugar
  // I'll be out between 4 and 22 this month
  // I was the fifth person to finish the 10 km race
  // The temperature this night will be of 40 deg celsius
  // The american stock exchange said a seat was sold for down $ 5,000 from the previous sale last friday
  // It happened when the baby was only ten months old
  void _extractFromText() {
    final text = _inputTextController.text;
    print("Extracting data from text: '$text'");

    final result = GlobalRecognizer().recognize(text);

    final output = StringBuffer("Recognized items in '$text'\n");
    for (final item in result) {
      output.writeln(" • '${item.text}' - ${item.start} -> ${item.end}");
    }

    setState(() {
      final outputText = AttributedText(text);
      for (final item in result) {
        outputText.addAttribution(
          const _Extraction(),
          SpanRange(item.start, item.end),
        );
      }

      _output = outputText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputTextController,
                      decoration: InputDecoration(
                        hintText: "Enter some natural text",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _extractFromText(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _extractFromText,
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 500),
                child: SingleChildScrollView(
                  child: _output == null
                      ? Text(
                          "Output...",
                        )
                      : Text.rich(_output!.computeTextSpan((attributions) {
                          if (attributions.contains(const _Extraction())) {
                            return TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            );
                          }
                          return TextStyle(
                            color: const Color(0xFFAAAAAA),
                          );
                        })),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class _Extraction implements Attribution {
  const _Extraction();

  @override
  String get id => "extraction";

  @override
  bool canMergeWith(Attribution other) {
    return other is _Extraction;
  }
}

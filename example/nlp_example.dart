// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';

import 'package:mason_logger/mason_logger.dart';
import 'package:nlp/nlp.dart';

final logger = Logger();

void main() {
  _printIntro();

  do {
    final textToRecognize = logger.prompt("Enter the text to recognize:");
    if (textToRecognize.trim().toLowerCase() == "exit") {
      logger.info("Thanks for trying the example app! Goodbye.");
      logger.info("");
      return;
    }
    if (textToRecognize.trim().isEmpty) {
      logger.info("You didn't enter any text to recognize!");
      logger.info("");
      continue;
    }

    // Datetime recognizer This model will find any Date even if its write in colloquial language
    // E.g "I'll go back 8pm today" will return "2017-10-04 20:00:00"
    final results = DateTimeRecognizer.recognizeDateTime(textToRecognize);

    logger.info("I found the following entities (${results.length})");
    for (final result in results) {
      logger.info("Type: ${result.typeName}");
      JsonEncoder.withIndent("  ").convert({
        "parentText": result.parentText,
        "text": result.text,
        "start": result.start,
        "end": result.end,
        "typeName": result.typeName,
        "resolution": result.resolution,
      });
    }

    logger.info("");
  } while (true);
}

void _printIntro() {
  logger.info("Welcome to the example app for the nlp package!");
  logger.info("");
  logger.info("This example app is based on the Microsoft Recognizers project.");
  logger.info("");
  logger.info(
      "To try the recognizers enter a phrase and let us show you the different outputs for each recognizer or just type 'exit' to leave the application.");
  logger.info("");
  logger.info("Here are some examples you could try:");
  logger.info("");
  logger.info("\"I want twenty meters of cable for tomorrow\"");
  logger.info("\"I'll be available tomorrow from 11am to 2pm to receive up to 5kg of sugar\"");
  logger.info("\"I'll be out between 4 and 22 this month\"");
  logger.info("\"I was the fifth person to finish the 10 km race\"");
  logger.info("\"The temperature this night will be of 40 deg celsius\"");
  logger
      .info("\"The american stock exchange said a seat was sold for down \$5,000 from the previous sale last friday\"");
  logger.info("\"It happened when the baby was only ten months old\"");
  logger.info("");
}

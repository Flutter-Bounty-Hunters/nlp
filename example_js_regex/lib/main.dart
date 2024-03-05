import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
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

  void _extractFromText() {
    final text = _inputTextController.text;

    final result = GlobalRecognizer.recognize(text);

    setState(() {
      var outputText = AttributedText(text);

      for (final item in result) {
        outputText.addAttribution(
          _Extraction(HSVColor.fromAHSV(1.0, Random().nextDouble() * 360, 1.0, 1.0).toColor()),
          SpanRange(item.start, item.end),
        );
      }

      final additionalInfo = StringBuffer("\n-----------\nRecognized items in '$text'\n");
      for (final item in result) {
        additionalInfo
          ..writeln("")
          ..writeln(" • '${item.text}' - ${item.start} -> ${item.end}")
          ..writeln(const JsonEncoder.withIndent("  ").convert(item.resolution));
      }
      outputText = outputText.copyAndAppend(AttributedText(additionalInfo.toString()));

      _output = outputText;
    });
  }

  void _onPreCannedInputSelected(String preCannedInput) {
    _inputTextController.text = preCannedInput;
    _extractFromText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: _buildMainContent(),
          ),
          _buildPreCannedInputsList(),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Center(
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
                      decoration: const InputDecoration(
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
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 500),
                child: SingleChildScrollView(
                  child: _output == null
                      ? const Text(
                          "Output...",
                        )
                      : Text.rich(
                          _output!.computeTextSpan(
                            (attributions) {
                              final extraction =
                                  attributions.firstWhereOrNull((item) => item is _Extraction) as _Extraction?;
                              if (extraction != null) {
                                return TextStyle(
                                  color: extraction.color,
                                  fontWeight: FontWeight.bold,
                                );
                              }

                              return const TextStyle(
                                color: Color(0xFFAAAAAA),
                              );
                            },
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreCannedInputsList() {
    return Container(
      width: 400,
      height: double.infinity,
      color: const Color(0xFFEEEEEE),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final preCannedInput in _preCannedInputs)
                _PreCannedInputChip(
                  preCannedInput: preCannedInput,
                  onPressed: _onPreCannedInputSelected,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

const _preCannedInputs = [
  "It happened when the baby was only ten months old",
  "I'll leave for 3h",
  "The project estimative is a 2 ys duration",
  "We've been in Pakistan for 2ys",
  "I'll leave for 1 year 1 month 21 days",
  "I'll leave for 2 days 1 month",
  "Send a birthday card to Dad every year on May 3rd",
  "Change Tires on Car next Tuesday at 5pm",
];

/// Chip that displays a line of pre-canned input, which can be run through NLP
/// to extract meaningful tokens.
class _PreCannedInputChip extends StatefulWidget {
  const _PreCannedInputChip({
    required this.preCannedInput,
    required this.onPressed,
  });

  final String preCannedInput;

  final void Function(String input) onPressed;

  @override
  State<_PreCannedInputChip> createState() => _PreCannedInputChipState();
}

class _PreCannedInputChipState extends State<_PreCannedInputChip> {
  bool _isHovering = false;

  void _onHoverStart() {
    setState(() {
      _isHovering = true;
    });
  }

  void _onHoverEnd() {
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(widget.preCannedInput),
      child: MouseRegion(
        onEnter: (_) => _onHoverStart(),
        onExit: (_) => _onHoverEnd(),
        hitTestBehavior: HitTestBehavior.opaque,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: _isHovering ? const Color(0xFFCC0000) : Colors.red,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            widget.preCannedInput,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/// Attribution that marks a single extracted NLP value.
class _Extraction implements Attribution {
  const _Extraction(this.color);

  @override
  String get id => "extraction";

  final Color color;

  @override
  bool canMergeWith(Attribution other) {
    return other is _Extraction && color.value == other.color.value;
  }
}

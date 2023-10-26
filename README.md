# Natural Language Processing (NLP) for Dart
Natural language processing (NLP) identifies substrings within text, which represent a useful piece
of information, and then associates the substring with that information.

For example, NLP might receive text that says "I'll do it tomorrow". NLP identifies "tomorrow" as
a meaningful term, and NLP is aware that "tomorrow" means the day after today. As a result, NLP
associates "tomorrow" with a Dart `DateTime` that points to the day after today.

NLP can be implemented for any such association. For example, NLP might be implemented to recognize
that a number word, like "two", represents an `int`, like `2`. NLP is limited only by the data
models and text recognizers, which are used to inspect the meaning of text.
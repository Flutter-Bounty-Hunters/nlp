# Flutter project to run RegEx with JS support

Dart lacks support for reporting the indices of named capture groups, i.e., we can't get
the location in the original string where a named capture group was found. But we need this
RegEx behavior.

JavaScript supports the reporting of indices for named capture groups.

This Flutter project exists to bring JavaScript named group indices into Dart. This is a
temporary approach because we'll eventually need cross-platform support. We'll prove our
ability to implement the desired behavior using JS and then find some way to port that
behavior to Dart for the final product.

## Integration Tests
Because we depend upon JavaScript RegExp behavior, we can't run traditional Dart language
tests, or even Flutter widget tests. We have to run web integration tests so that we can
access JavaScript RegEx capabilities.

To run the integration tests in this project, first start chromedriver:

```shell
chromedriver --port=4444
```

Then, run the desired integration tests:

```shell
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/time/time_zone_extractor_test.dart -d chrome
```


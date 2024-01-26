abstract class Recognizer<TRecognizerOptions extends Enum<TRecognizerOptions>> {

  Recognizer(String targetCulture, TRecognizerOptions options, boolean lazyInitialization) {
    this.targetCulture = targetCulture;
    this.options = options;

    this.factory = new ModelFactory<>();
    this.initializeConfiguration();

    if (!lazyInitialization) {
      this.initializeModels(targetCulture, options);
    }
  }

  final String targetCulture;
  final TRecognizerOptions options;

  final ModelFactory<TRecognizerOptions> factory;

  <T extends IModel> T getModel(Class<T> modelType, String culture, bool fallbackToDefaultCulture) {
    return this.factory.getModel(
        modelType,
        culture != null ? culture : targetCulture,
        fallbackToDefaultCulture,
        options);
  }

  <T extends IModel> void registerModel(Class<T> modelType, String culture, Function<TRecognizerOptions, IModel> modelCreator) {
    this.factory.put(new Pair<>(culture, modelType), modelCreator);
  }

  void initializeModels(String targetCulture, TRecognizerOptions options) {
    this.factory.initializeModels(targetCulture, options);
  }

  abstract void initializeConfiguration();
}
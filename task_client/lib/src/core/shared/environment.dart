class Env {
  static String get baseUrl => const String.fromEnvironment('URL');
  static String get apiVersion => const String.fromEnvironment('API_VERSION');
}

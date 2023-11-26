import 'package:moniepoint/core/core.dart';

enum Env {
  dev(description: "", httpBaseUrl: Endpoints.baseUrl),
  prod(description: "", httpBaseUrl: Endpoints.baseUrl),
  staging(description: "", httpBaseUrl: Endpoints.baseUrl),
  mock(description: "", httpBaseUrl: "");

  final String description;
  final String httpBaseUrl;

  bool get isProd => this == Env.prod;

  const Env({required this.description, required this.httpBaseUrl});
}

class Environment {
  static Env get fromConfig {
    String env = const String.fromEnvironment("env.mode");
    switch (env) {
      case "mock":
        return Env.mock;
      case "dev":
        return Env.dev;
      case "prod":
        return Env.prod;
      default:
        return Env.prod;
    }
  }
}

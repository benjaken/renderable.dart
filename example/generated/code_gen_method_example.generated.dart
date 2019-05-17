class CodeGenMethodExample {
  dynamic defaultMethod() {}

  int basicMethod() {
    int a = 100;
    int b = 33;
    int c = a + b;
    return c;
  }

  static String staticMethod() {}

  static Future<String> staticAsyncMethod() async {}

  Iterable<String> syncGeneratorMethod() sync* {}

  Stream<String> asyncGeneratorMethod() async* {}
}

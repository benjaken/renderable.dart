

class CodeGenMethodExample {

    dynamic defaultMethod() {
      
    }

    int basicMethod() {
      int a = 100;
int b = 33;
int c = a + b;
return c;
    }

    static String staticMethod() {
      
    }

    static Future<String> staticAsyncMethod() async {
      
    }

    Iterable<String> syncGeneratorMethod() sync* {
      
    }

    Stream<String> asyncGeneratorMethod() async* {
      
    }

    Stream<List<int>> returnGenericValueMethod() {
      
    }

    void genericMethod<T, R extends List>() {
      
    }

    void parametersMethod(int a, int b, {int c, int d}) {
      
    }

    void parametersMethod2(int a, int b, [int c, int d]) {
      
    }

    void genericParameterMethod([List<int> a]) {
      
    }

    void functionParameterMethod(List<int> a(double d)) {
      
    }

}

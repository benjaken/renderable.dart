# CodeGen
A element-model-based Dart code generator

### Quick Start
let's create a simple class named 'HelloWorld'.

```dart
import 'package:code_gen/code_gen.dart';

void main() {
  FileElement(
    filePath: 'helloWorld.dart',
    renders: [
      ClassElement(
        name: 'HelloWorld',
      ),
    ],
  ).writeToFile();
}
```

It will generate:
```dart
// file: helloWorld.dart

class HelloWorld {
  
}
```

explains:
1. `FileElement` will create a file element which can generate a file using `renders` and `imports` to `filePath`.
1. `ClassElement` will create a class element model which can generate a class with the given `name`.

let's create an abstract class named MyHelloWorld which extends HelloWorld in another file.

```dart
import 'package:code_gen/code_gen.dart';

void main() {
  FileElement(
    filePath: 'myHelloWorld.dart',
    imports: [
      ImportElement(path: 'helloWorld.dart'),
    ],
    renders: [
      ClassElement(
        isAbstract: true,
        name: 'MyHelloWorld',
        supertype: InterfaceType(name: 'HelloWorld'),
      ),
    ],
  ).writeToFile();
}
```

It will generate:
```dart
// file: myHelloWorld.dart

import 'helloWorld.dart';

abstract class MyHelloWorld extends HelloWorld {
  
}
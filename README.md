# CodeGen
A element-model-based Dart code generator

### Quick Start
let's create a simple class named 'HelloWorld'.

```dart
import 'package:code_gen/code_gen.dart';

void main() {
  FileRenderElement(
    filePath: 'helloWorld.dart',
    renders: [
      ClassRenderElement(
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
1. `FileRenderElement` will create a file element which can generate a file using `renders` and `imports` to `filePath`.
1. `ClassRenderElement` will create a class element model which can generate a class with the given `name`.

let's create an abstract class named MyHelloWorld which extends HelloWorld in another file.

```dart
import 'package:code_gen/code_gen.dart';

void main() {
  FileRenderElement(
    filePath: 'myHelloWorld.dart',
    imports: [
      ImportRenderElement(path: 'helloWorld.dart'),
    ],
    renders: [
      ClassRenderElement(
        isAbstract: true,
        name: 'MyHelloWorld',
        supertype: InterfaceRenderType(name: 'HelloWorld'),
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
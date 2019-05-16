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

It will generates
```dart
// file: helloWorld.dart

class HelloWorld {
  
}
```
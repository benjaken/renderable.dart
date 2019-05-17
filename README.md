# CodeGen
A element-model-based analyzer-like Dart code generator.

### RoadMap
- [x] File
- [x] Import
- [ ] Class
    - [x] Basic info
    - [ ] Field
        - [x] Basic field
        - [ ] Getter
        - [ ] Setter
    - [ ] Method
        - [x] Basic method
        - [x] Generic type (Type parameter)
        - [x] Statement body
        - [ ] Parameter
            - [ ] Basic parameter
            - [ ] Generic parameter
            - [ ] Different type parameter
            - [ ] Function parameter
- [ ] Function
- [ ] Statement
- [ ] Value
- [ ] SubClass

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

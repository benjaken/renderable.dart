# CodeGen
An element-model-based Dart code generator. 
CodeGen's AnalyzerConverter can convert SourceGen code to CodeGen code by calling one method.

### Updates
First version will release when ClassElement is finished

### Version Number
A.B.C

A is Master Version Number: changes when large breaking change happens
B is Feature Version Number: changes when new feature comes out
C is Edition Version Number: changes on hotfix and code improvement

### RoadMap
- [x] File
- [x] Import
- [ ] Class
    - [x] Basic info
    - [ ] Field
        - [x] Basic field
        - [ ] Getter
        - [ ] Setter
    - [x] Method
- [ ] Function
- [ ] Statement
- [ ] Value
- [ ] SubClass

### Quick Start

#### Simple Demo
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

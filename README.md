# Renderable
An element-model-based Dart code generator. 
Renderable's AnalyzerConverter can convert SourceGen code to Renderable code by calling one method.

### RoadMap
- [x] File
- [x] Import
- [x] Class
- [x] Function
- [ ] Statement
    - [x] raw statement
    - [x] variable declaration
    - [x] assignment
    - [x] compound assignment
    - [x] basic math (+, -, *, /, %)
    - [ ] if/else/switch/case condition statement
    - [ ] for/while loop statement
    - [ ] type test
    - [ ] relational operator
    - [ ] logic operator
    - [ ] bitwise and shift operators
    - [ ] other
- [x] Value
- [ ] Miscellaneous
    - [ ] typedef
    - [x] part
    - [ ] part of
- [ ] Demo
    - [x] class basic info
    - [x] class field
    - [x] class method
    - [ ] class getter
    - [ ] class setter
    - [ ] function
    - [x] statement
    - [x] value
    - [ ] subclass
    - [ ] misc

### Quick Start

#### Simple Demo
let's create a simple class named 'HelloWorld'.

```dart
import 'package:renderable/renderable.dart';

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

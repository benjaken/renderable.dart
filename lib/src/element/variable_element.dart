import 'package:code_gen/src/element/element.dart';
import 'package:code_gen/src/type/dart_type.dart';

class VariableElement implements Element {
  bool isConst;

  bool isStatic;

  bool isFinal;

  DartType type;

  @override
  String name;
}

import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/type/dart_type.dart';

abstract class VariableElement implements Element {
  bool isConst;

  bool isStatic;

  bool isFinal;

  DartType type;

  @override
  String name;

  @override
  bool isSynthetic;
}

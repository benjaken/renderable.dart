import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/element/variable_element.dart';
import 'package:renderable/src/type/dart_type.dart';

class VariableDeclarationStatement extends Statement implements VariableElement {
  @override
  bool isConst;

  @override
  bool isFinal;

  @override
  bool isStatic;

  @override
  String name;

  @override
  DartType type;

  @override
  bool isSynthetic;

  Renderable value;

  VariableDeclarationStatement({
    @required this.name,
    this.type,
    this.value,
    this.isStatic = false,
    this.isConst = false,
    this.isFinal = false,
  }) {
    this.type ??= DartType(name: 'var');
  }

  @override
  String render() {
    return value == null ? '$type $name;' : '$type $name = $value;';
  }
}

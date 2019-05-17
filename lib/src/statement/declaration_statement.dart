import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/statement.dart';
import 'package:code_gen/src/element/variable_element.dart';
import 'package:code_gen/src/type/dart_type.dart';
import 'package:meta/meta.dart';

class DeclarationStatement extends Statement implements VariableElement {
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

  Renderable value;

  DeclarationStatement({
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
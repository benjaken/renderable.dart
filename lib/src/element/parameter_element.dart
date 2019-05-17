import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/local_element.dart';
import 'package:code_gen/src/element/type_parameter_element.dart';
import 'package:code_gen/src/element/variable_element.dart';
import 'package:code_gen/src/type/dart_type.dart';
import 'package:meta/meta.dart';

class ParameterElement extends Renderable implements VariableElement, LocalElement {
  bool isRequired;

  bool isNamed;

  bool isOptionalPositional;

  bool hasRequired;

  String defaultValue;

  List<TypeParameterElement> typeParameters;

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

  ParameterElement({
    @required this.name,
    this.type,
    this.isRequired = false,
    this.isNamed = false,
    this.isOptionalPositional = false,
    this.hasRequired,
    this.defaultValue,
  }) {
    this.type ??= DartType(name: 'dynamic');
  }

  @override
  String render() {
    return '$type $name';
  }
}

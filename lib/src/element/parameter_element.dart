import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/local_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/element/variable_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/type/type_parameter_type.dart';
import 'package:renderable/src/util/parameter_element_util.dart';
import 'package:renderable/src/util/template_utils.dart';

class ParameterElement extends Renderable implements VariableElement, LocalElement {
  bool isRequired;

  bool isNamed;

  bool isOptionalPositional;

  Renderable defaultValue;

  List<TypeParameterElement> typeParameters;

  List<ParameterElement> parameters;

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

  ParameterElement({
    @required this.name,
    this.type,
    this.isRequired = false,
    this.isNamed = false,
    this.isOptionalPositional = false,
    this.defaultValue,
    this.typeParameters,
    this.parameters,
  }) {
    type ??= DartType(name: 'dynamic');
    typeParameters ??= [];
    parameters ??= [];
  }

  factory ParameterElement.required({
    @required String name,
    DartType type,
    Renderable defaultValue,
    List<TypeParameterElement> typeParameters,
    List<ParameterElement> parameters,
  }) {
    return ParameterElement(
      name: name,
      type: type,
      defaultValue: defaultValue,
      typeParameters: typeParameters,
      parameters: parameters,
      isRequired: true,
    );
  }

  factory ParameterElement.named({
    @required String name,
    DartType type,
    Renderable defaultValue,
    List<TypeParameterElement> typeParameters,
    List<ParameterElement> parameters,
  }) {
    return ParameterElement(
      name: name,
      type: type,
      defaultValue: defaultValue,
      typeParameters: typeParameters,
      parameters: parameters,
      isNamed: true,
    );
  }

  factory ParameterElement.optional({
    @required String name,
    DartType type,
    Renderable defaultValue,
    List<TypeParameterElement> typeParameters,
    List<ParameterElement> parameters,
  }) {
    return ParameterElement(
      name: name,
      type: type,
      defaultValue: defaultValue,
      typeParameters: typeParameters,
      parameters: parameters,
      isOptionalPositional: true,
    );
  }

  @override
  String render() {
    assert(!isRequired || defaultValue == null, 'Required parameter can\'t have default value');
    assert(isRequired || isNamed || isOptionalPositional,
        'Parameter must be one of isRequired, isNamed or isOptionalPositional');

    String defaultValueString = defaultValue == null ? '' : ' = $defaultValue';

    if (type is FunctionType) {
      return '${TemplateUtils.stringFromDartType((type as FunctionType).returnType)} $name(${ParameterElementUtil.generateParameter((type as FunctionType).parameters)})$defaultValueString';
    }

    if (type is TypeParameterType) {
      return '${TemplateUtils.stringFromDartType(type)} $name$defaultValueString';
    }

    return '${TemplateUtils.stringFromDartType(type)} $name$defaultValueString';
  }
}

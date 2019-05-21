import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/local_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/element/variable_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/type/type_parameter_type.dart';
import 'package:renderable/src/util/parameter_element_util.dart';
import 'package:meta/meta.dart';

class ParameterElement extends Renderable implements VariableElement, LocalElement {
  bool isRequired;

  bool isNamed;

  bool isOptionalPositional;

  bool hasRequired;

  String defaultValue;

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
    this.hasRequired = false,
    this.defaultValue,
    this.typeParameters,
    this.parameters,
  }) {
    type ??= DartType(name: 'dynamic');
    typeParameters ??= [];
    parameters ??= [];
  }

  @override
  String render() {
    assert(!isRequired || defaultValue == null, 'Required parameter can\'t have default value');
    assert(isRequired || isNamed || isOptionalPositional,
        'Parameter must be one of isRequired, isNamed or isOptionalPositional');

    String defaultValueString = defaultValue == null ? '' : ' = $defaultValue';

    /// todo: use annotation instead
    String annotationString = hasRequired ? '@required ' : '';

    /// for function
    if (parameters.isNotEmpty) {
      return '$type $name(${ParameterElementUtil.generateParameter(parameters)})$defaultValueString';
    }

    if (type is FunctionType) {
      return '${(type as FunctionType).returnType} $name(${ParameterElementUtil.generateParameter((type as FunctionType).parameters)})$defaultValueString';
//      return '${(type as FunctionType).returnType} $name<${(type as FunctionType).typeParameters.join(', ')}>(${ParameterElementUtil.generateParameter((type as FunctionType).parameters)})';
    }

    if (type is TypeParameterType) {
      return '$annotationString${type.name} $name$defaultValueString';
    }

    return '$annotationString$type $name$defaultValueString';
  }
}

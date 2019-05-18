import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/local_element.dart';
import 'package:code_gen/src/element/type_parameter_element.dart';
import 'package:code_gen/src/element/variable_element.dart';
import 'package:code_gen/src/type/dart_type.dart';
import 'package:code_gen/src/type/function_type.dart';
import 'package:code_gen/src/util/parameter_element_util.dart';
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

  ParameterElement({
    @required this.name,
    this.type,
    this.isRequired = false,
    this.isNamed = false,
    this.isOptionalPositional = false,
    this.hasRequired,
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

    String defaultValueString = defaultValue == null ? '' : ' = $defaultValue';

    if (parameters.isNotEmpty) {
      return '$type $name(${ParameterElementUtil.generateParameter(parameters)})$defaultValueString';
    }

    if (type is FunctionType) {
//      if ((type as FunctionType).typeParameters.isEmpty) {
      return '${(type as FunctionType).returnType} $name(${ParameterElementUtil.generateParameter((type as FunctionType).parameters)})$defaultValueString';
//      }
//      return '${(type as FunctionType).returnType} $name<${(type as FunctionType).typeParameters.join(', ')}>(${ParameterElementUtil.generateParameter((type as FunctionType).parameters)})';
    }

    return '$type $name$defaultValueString';
  }
}

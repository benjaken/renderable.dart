import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/parameterized_type.dart';
import 'package:renderable/src/util/parameter_element_util.dart';

class FunctionType extends Renderable implements ParameterizedType {
  List<ParameterElement> parameters;

  DartType returnType;

  @override
  String name;

  @override
  String prefix = null;

  @override
  List<DartType> typeArguments = [];

  @override
  List<TypeParameterElement> typeParameters;

  FunctionType({
    this.name,
    this.parameters,
    this.returnType,
    this.typeParameters,
  }) {
    parameters ??= [];
    typeParameters ??= [];
  }

  @override
  String render() {
    if (typeParameters.isEmpty) {
      return '$returnType $name(${ParameterElementUtil.generateParameter(parameters)})';
    }
    return '$returnType $name<${typeParameters.join(', ')}>(${ParameterElementUtil.generateParameter(parameters)})';
  }
}

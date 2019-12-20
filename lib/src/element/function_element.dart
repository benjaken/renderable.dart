import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/executable_element.dart';
import 'package:renderable/src/element/local_element.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/misc/function_body.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/util/parameter_element_util.dart';
import 'package:renderable/src/util/template_utils.dart';

class FunctionElement extends Renderable implements ExecutableElement, LocalElement {
  FunctionBody body;

  @override
  bool isAbstract;

  @override
  bool isAsynchronous;

  @override
  bool isExternal;

  @override
  bool isGenerator;

  @override
  bool isStatic;

  @override
  bool isSynthetic;

  @override
  String name;

  @override
  List<ParameterElement> parameters;

  @override
  DartType returnType;

  @override
  FunctionType type;

  @override
  List<TypeParameterElement> typeParameters;

  FunctionElement({
    @required this.name,
    this.returnType,
    this.body,
    this.parameters,
    this.isGenerator = false,
    this.isAsynchronous = false,
  }) {
    parameters ??= [];
  }

  @override
  String render() {
    String functionModifiersString = TemplateUtils.generateFunctionModifiers(
      isAsynchronous: isAsynchronous,
      isGenerator: isGenerator,
    );

    String parametersString = ParameterElementUtil.generateParameter(parameters);

    return [
      '$returnType $name($parametersString}) $functionModifiersString {',
      body,
      '}',
    ].join('\n');
  }
}

import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/class_member_element.dart';
import 'package:renderable/src/element/executable_element.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/misc/function_body.dart';
import 'package:renderable/src/template/class_method_element_template.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/interface_type.dart';
import 'package:renderable/src/type/parameterized_type.dart';
import 'package:renderable/src/util/parameter_element_util.dart';
import 'package:renderable/src/util/template_util.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class MethodElement extends Renderable implements ClassMemberElement, ExecutableElement {
  FunctionBody body;

  @override
  bool isStatic;

  @override
  bool isAbstract;

  @override
  bool isAsynchronous;

  @override
  bool isExternal;

  @override
  bool isGenerator;

  @override
  String name;

  @override
  List<ParameterElement> parameters;

  @override
  DartType returnType;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  ParameterizedType type = null;

  MethodElement({
    @required this.name,
    this.returnType,
    this.isAbstract = false,
    this.isAsynchronous = false,
    this.isStatic = false,
    this.isExternal = false,
    this.isGenerator = false,
    this.typeParameters,
    this.parameters,
    this.body,
  }) {
    returnType ??= InterfaceType(name: 'dynamic');
    typeParameters ??= [];
    parameters ??= [];
  }

  String _renderTypeParameters() {
    return typeParameters.isEmpty ? '' : '<${typeParameters.join(', ')}>';
  }

  @override
  String render() {
    return mu.render(
      class_method_element_template,
      {
        'name': name,
        'returnType': returnType,
        'isAbstract': isAbstract,
        'modifiers': TemplateUtil.generateModifiers(isStatic: isStatic),
        'functionModifiers': TemplateUtil.generateFunctionModifiers(
          isAsynchronous: isAsynchronous,
          isGenerator: isGenerator,
        ),
        'body': body,
        'typeParametersString': _renderTypeParameters(),
        'parametersString': ParameterElementUtil.generateParameter(parameters),
      },
    );
  }
}

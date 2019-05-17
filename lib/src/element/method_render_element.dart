import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/class_member_render_element.dart';
import 'package:code_gen/src/element/executable_render_element.dart';
import 'package:code_gen/src/element/parameter_render_element.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/template/class_method_render_element_template.dart';
import 'package:code_gen/src/type/interface_render_type.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';
import 'package:code_gen/src/util/template_util.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class MethodRenderElement extends Renderable
    implements ClassMemberRenderElement, ExecutableRenderElement {
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
  List<ParameterRenderElement> parameters;

  @override
  InterfaceRenderType returnType;

  @override
  List<TypeParameterRenderElement> typeParameters;

  @override
  ParameterizedRenderType type = null;

  MethodRenderElement({
    @required this.name,
    this.returnType,
    this.isAbstract = false,
    this.isAsynchronous = false,
    this.isStatic = false,
    this.isExternal = false,
    this.isGenerator = false,
    this.typeParameters,
    this.parameters,
  }) {
    returnType ??= InterfaceRenderType(name: 'dynamic');
    typeParameters ??= [];
    parameters ??= [];
  }

  @override
  String render() {
    return mu.render(
      class_method_render_element_template,
      {
        'name': name,
        'returnType': returnType,
        'isAbstract': isAbstract,
        'modifiers': TemplateUtil.generateModifiers(isStatic: isStatic),
        'functionModifiers': TemplateUtil.generateFunctionModifiers(
          isAsynchronous: isAsynchronous,
          isGenerator: isGenerator,
        ),
      },
    );
  }
}

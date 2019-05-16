import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/class_member_render_element.dart';
import 'package:code_gen/src/element/executable_render_element.dart';
import 'package:code_gen/src/element/parameter_render_element.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/type/interface_render_type.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';

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

  @override
  String render() {
    assert(!isAsynchronous || !isGenerator, 'Only one of isAsynchronous and isGenerator can be used');
  }
}

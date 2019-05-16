import 'package:analyzer/dart/element/element.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/element/type_parameterized_render_element.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';

class InterfaceRenderType extends Renderable implements ParameterizedRenderType {
  String prefix;

  InterfaceRenderType({
    this.name,
    this.prefix,
  });

  @override
  String render() {
    return prefix == null ? (name ?? '') : '$prefix.$name';
  }

  @override
  String name;

  @override
  List<TypeParameterRenderElement> typeParameters;
}

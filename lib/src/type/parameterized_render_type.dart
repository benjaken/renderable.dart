import 'package:analyzer/dart/element/element.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:meta/meta.dart';

class ParameterizedRenderType extends Renderable {
  String name;

  String prefix;

  List<TypeParameterRenderElement> typeParameters;

  ParameterizedRenderType({
    @required this.name,
    this.prefix,
  });

  @override
  String render() {
    return prefix == null ? name : '$prefix.$name';
  }
}

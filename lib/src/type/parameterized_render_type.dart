import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/type/dart_render_type.dart';
import 'package:meta/meta.dart';

class ParameterizedRenderType extends Renderable implements DartRenderType {
  String prefix;

  List<ParameterizedRenderType> typeArguments;

  List<TypeParameterRenderElement> typeParameters;

  @override
  String name;

  ParameterizedRenderType({
    @required this.name,
    this.prefix,
  });

  @override
  String render() {
    return prefix == null ? name : '$prefix.$name';
  }
}

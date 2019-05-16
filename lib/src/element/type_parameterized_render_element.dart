import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/render_element.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';

class TypeParameterizedRenderElement extends Renderable implements RenderElement {
  ParameterizedRenderType type;

  List<TypeParameterRenderElement> typeParameters;

  @override
  String name;

  @override
  String render() {
    if (typeParameters.isEmpty) {
      return type.render();
    }
    return '${type.render()}<${typeParameters.join(', ')}>';
  }
}

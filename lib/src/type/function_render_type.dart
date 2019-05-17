import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';

class FunctionRenderType extends Renderable implements ParameterizedRenderType {
  @override
  String name;

  @override
  String prefix = null;

  @override
  List<ParameterizedRenderType> typeArguments;

  @override
  List<TypeParameterRenderElement> typeParameters;

  @override
  String render() {
    // TODO: implement render
  }
}

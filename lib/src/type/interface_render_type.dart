import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';
import 'package:meta/meta.dart';

class InterfaceRenderType extends Renderable implements ParameterizedRenderType {
  String prefix;

  @override
  String name;

  @override
  List<ParameterizedRenderType> typeArguments;

  @override
  List<TypeParameterRenderElement> typeParameters;

  InterfaceRenderType({
    @required this.name,
    this.prefix,
    this.typeParameters,
  }) {
    this.typeParameters ??= [];
  }

  @override
  String render() {
    String typeParametersString = typeParameters.isEmpty ? '' : '<${typeParameters.join(', ')}>';
    if (prefix == null) {
      return '$name$typeParametersString';
    }
    return '$prefix.$name$typeParametersString';
  }
}

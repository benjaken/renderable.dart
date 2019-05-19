import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/parameterized_type.dart';

class TypeParameterizedElement extends Renderable implements Element {
  ParameterizedType type;

  List<TypeParameterElement> typeParameters;

  @override
  String name;

  @override
  bool isSynthetic;

  @override
  String render() {
    if (typeParameters.isEmpty) {
      return type.render();
    }
    return '${type.render()}<${typeParameters.join(', ')}>';
  }
}

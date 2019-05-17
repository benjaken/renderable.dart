import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/element.dart';
import 'package:code_gen/src/element/type_parameter_element.dart';
import 'package:code_gen/src/type/parameterized_type.dart';

class TypeParameterizedElement extends Renderable implements Element {
  ParameterizedType type;

  List<TypeParameterElement> typeParameters;

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

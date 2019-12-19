import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/parameterized_type.dart';
import 'package:renderable/src/type/type_parameter_type.dart';

class InterfaceType extends Renderable implements ParameterizedType {
  String prefix;

  @override
  String name;

  @override
  List<DartType> typeArguments;

  @override
  List<TypeParameterElement> typeParameters;

  InterfaceType({
    @required this.name,
    this.prefix,
    this.typeParameters,
    this.typeArguments,
  }) {
    assert(!this.name.contains('<'), 'The name shouldn\'t contains generic type');
    this.typeParameters ??= [];
    this.typeArguments ??= [];
  }

  String _renderTypeParameter() {
    return typeParameters.isEmpty ? '' : '<${typeParameters.join(', ')}>';
  }

  String _renderTypeArguments() {
    return typeArguments.isEmpty
        ? ''
        : '<${typeArguments.map((e) {
            return e is TypeParameterType ? e.name : e.render();
          }).join(', ')}>';
  }

  @override
  String render() {
    assert(typeArguments.isEmpty || typeParameters.isEmpty,
        'Only one of typeArguments and typeParameters can be used',);

    String generic = typeArguments.isNotEmpty ? _renderTypeArguments() : _renderTypeParameter();

    if (prefix == null) {
      return '$name$generic';
    }

    return '$prefix.$name$generic';
  }
}

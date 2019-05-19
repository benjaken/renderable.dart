import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:meta/meta.dart';

class ParameterizedType extends Renderable implements DartType {
  String prefix;

  List<DartType> typeArguments;

  List<TypeParameterElement> typeParameters;

  @override
  String name;

  ParameterizedType({
    @required this.name,
    this.prefix,
    this.typeParameters,
    this.typeArguments,
  }) {
    typeParameters ??= [];
    typeArguments ??= [];
  }

  @override
  String render() {
    return prefix == null ? name : '$prefix.$name';
  }
}

import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_element.dart';
import 'package:code_gen/src/type/dart_type.dart';
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
  });

  @override
  String render() {
    return prefix == null ? name : '$prefix.$name';
  }
}

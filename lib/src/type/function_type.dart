import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/type_parameter_element.dart';
import 'package:code_gen/src/type/dart_type.dart';
import 'package:code_gen/src/type/parameterized_type.dart';

class FunctionType extends Renderable implements ParameterizedType {
  @override
  String name;

  @override
  String prefix = null;

  @override
  List<DartType> typeArguments;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  String render() {
    // TODO: implement render
  }
}

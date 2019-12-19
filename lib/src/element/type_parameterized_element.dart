import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';

abstract class TypeParameterizedElement implements Element {
  List<TypeParameterElement> typeParameters;

  @override
  bool isSynthetic;
}

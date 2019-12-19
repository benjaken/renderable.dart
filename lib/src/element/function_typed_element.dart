import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/type_parameterized_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';

abstract class FunctionTypedElement implements TypeParameterizedElement {
  List<ParameterElement> parameters;

  DartType returnType;

  covariant FunctionType type;
}

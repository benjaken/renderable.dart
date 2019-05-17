import 'package:code_gen/src/element/parameter_element.dart';
import 'package:code_gen/src/element/type_parameterized_element.dart';
import 'package:code_gen/src/type/dart_type.dart';
import 'package:code_gen/src/type/interface_type.dart';

abstract class FunctionTypedElement implements TypeParameterizedElement {
  List<ParameterElement> parameters;

  DartType returnType;
}

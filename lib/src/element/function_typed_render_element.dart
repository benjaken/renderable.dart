import 'package:code_gen/src/element/parameter_render_element.dart';
import 'package:code_gen/src/element/type_parameterized_render_element.dart';
import 'package:code_gen/src/type/interface_render_type.dart';

abstract class FunctionTypedRenderElement implements TypeParameterizedRenderElement {
  List<ParameterRenderElement> parameters;

  InterfaceRenderType returnType;
}

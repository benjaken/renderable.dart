import 'package:analyzer/dart/element/element.dart';
import 'package:code_gen/src/element/render_element.dart';
import 'package:code_gen/src/type/interface_render_type.dart';
import 'package:code_gen/src/type/render_type.dart';

class VariableRenderElement implements RenderElement {
  bool isConst;

  bool isStatic;

  bool isFinal;

  InterfaceRenderType type;

  @override
  String name;
}

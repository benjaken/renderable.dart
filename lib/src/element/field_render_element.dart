import 'package:analyzer/dart/element/element.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/class_member_render_element.dart';
import 'package:code_gen/src/element/property_including_render_element.dart';
import 'package:code_gen/src/type/interface_render_type.dart';

class FieldRenderElement extends Renderable
    implements PropertyIncludingRenderElement, ClassMemberRenderElement {
  @override
  String name;

  @override
  bool isConst;

  @override
  bool isFinal;

  @override
  bool isStatic;

  @override
  InterfaceRenderType type;

  @override
  List<ElementAnnotation> metadata;

  @override
  String render() {}
}

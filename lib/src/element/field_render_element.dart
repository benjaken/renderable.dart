import 'package:analyzer/dart/element/element.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/class_member_render_element.dart';
import 'package:code_gen/src/element/property_including_render_element.dart';
import 'package:code_gen/src/template/class_field_render_element_template.dart';
import 'package:code_gen/src/type/interface_render_type.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

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

  Renderable value;

  FieldRenderElement({
    @required this.name,
    this.isStatic = false,
    this.isConst = false,
    this.isFinal = false,
    this.type,
    this.value,
  }) {
    this.type ??= InterfaceRenderType(name: 'dynamic');
  }

  @override
  String render() {
    assert(type != null, 'Field type can\'t be null');
    assert(!isFinal || !isConst, 'Members can\'t be declared to be both final and const');
    assert((isConst && isStatic) || (!isConst), 'Only static fields can be declared as const');

    return mu.render(
      class_field_render_element_template,
      this,
    );
  }
}

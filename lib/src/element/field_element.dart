import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/class_member_element.dart';
import 'package:code_gen/src/element/property_including_element.dart';
import 'package:code_gen/src/template/class_field_element_template.dart';
import 'package:code_gen/src/type/interface_type.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class FieldElement extends Renderable implements PropertyIncludingElement, ClassMemberElement {
  @override
  String name;

  @override
  bool isConst;

  @override
  bool isFinal;

  @override
  bool isStatic;

  @override
  InterfaceType type;

  Renderable value;

  FieldElement({
    @required this.name,
    this.isStatic = false,
    this.isConst = false,
    this.isFinal = false,
    this.type,
    this.value,
  }) {
    this.type ??= InterfaceType(name: 'dynamic');
  }

  @override
  String render() {
    assert(type != null, 'Field type can\'t be null');
    assert(!isFinal || !isConst, 'Members can\'t be declared to be both final and const');
    assert((isConst && isStatic) || (!isConst), 'Only static fields can be declared as const');

    return mu.render(
      class_field_element_template,
      this,
    );
  }
}

import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/class_member_element.dart';
import 'package:renderable/src/element/property_accessor_element.dart';
import 'package:renderable/src/element/property_inclucing_element.dart';
import 'package:renderable/src/template/class_field_element_template.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;
import 'package:renderable/src/util/property_accessor_element_utils.dart';

class FieldElement extends Renderable implements PropertyInclucingElement, ClassMemberElement {
  Renderable value;

  @override
  String name;

  @override
  bool isConst;

  @override
  bool isFinal;

  @override
  bool isStatic;

  @override
  DartType type;

  @override
  PropertyAccessorElement getter;

  @override
  PropertyAccessorElement setter;

  @override
  bool isSynthetic;

  FieldElement({
    @required this.name,
    this.isStatic = false,
    this.isConst = false,
    this.isFinal = false,
    this.isSynthetic = false,
    this.type,
    this.value,
    this.getter,
    this.setter,
  }) {
    this.type ??= DartType.dynamic;
    this.getter ??= PropertyAccessorElementUtils.createGetterFromField(this);
    this.setter ??= PropertyAccessorElementUtils.createSetterFromField(this);
  }

  @override
  String render() {
    assert(type != null, 'Field type can\'t be null');
    assert(!isFinal || !isConst, 'Members can\'t be declared to be both final and const');
    assert((isConst && isStatic) || (!isConst), 'Only static fields can be declared as const');

    if (isSynthetic) {
      return mu.render(class_field_element_accessor_template, this);
    }

    return mu.render(class_field_element_template, this);
  }
}

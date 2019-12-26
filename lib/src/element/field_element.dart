import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/element/class_member_element.dart';
import 'package:renderable/src/element/property_accessor_element.dart';
import 'package:renderable/src/element/property_inclucing_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/util/field_element_utils.dart';
import 'package:renderable/src/util/property_accessor_element_utils.dart';
import 'package:renderable/src/util/template_utils.dart';

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

  @deprecated
  PropertyAccessorElement getter;

  @deprecated
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
  }) {
    if (!isFinal && !isConst) {
      this.type ??= DartType.var_;
    }
  }

  @override
  String render() {
    assert(!isFinal || !isConst, 'Members can\'t be declared to be both final and const');
    assert((isConst && isStatic) || (!isConst), 'Only static fields can be declared as const');

    if (isSynthetic) {
      return null;
    }

    return TemplateUtils.stringFromList([
      TemplateUtils.stringFromModifiers(
        isStatic: isStatic,
        isConst: isConst,
        isFinal: isFinal,
      ),
      type,
      name,
      if (value != null) ["=", value],
    ], delimiter: " ", suffix: ";");
  }
}

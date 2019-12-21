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
    this.getter ??= PropertyAccessorElementUtils.createGetterFromField(this);
    this.setter ??= PropertyAccessorElementUtils.createSetterFromField(this);
    if (!isFinal) {
      this.type ??= DartType.var_;
    }
  }

  factory FieldElement.getter({
    @required String name,
    bool isStatic,
    bool isConst,
    bool isFinal,
    DartType type,
    List<Statement> statements,
  }) {
    var fieldElement = FieldElement(
      name: name,
      isStatic: isStatic,
      isConst: isConst,
      isFinal: isFinal,
    );
    FieldElementUtils.convertToGetter(fieldElement);
    fieldElement.getter.statements = statements;
    return fieldElement;
  }

  factory FieldElement.setter({
    @required String name,
    bool isStatic,
    bool isConst,
    bool isFinal,
    DartType type,
    List<Statement> statements,
  }) {
    var fieldElement = FieldElement(
      name: name,
      isStatic: isStatic,
      isConst: isConst,
      isFinal: isFinal,
    );
    FieldElementUtils.convertToSetter(fieldElement);
    fieldElement.setter.statements = statements;
    return fieldElement;
  }

  factory FieldElement.accessor({
    @required String name,
    bool isStatic,
    bool isConst,
    bool isFinal,
    DartType type,
  }) {
    var fieldElement = FieldElement(
      name: name,
      isStatic: isStatic,
      isConst: isConst,
      isFinal: isFinal,
    );
    FieldElementUtils.convertToAccessor(fieldElement);
    return fieldElement;
  }

  @override
  String render() {
    assert(type != null, 'Field type can\'t be null');
    assert(!isFinal || !isConst, 'Members can\'t be declared to be both final and const');
    assert((isConst && isStatic) || (!isConst), 'Only static fields can be declared as const');

    if (isSynthetic) {
      return TemplateUtils.stringFromList([
        getter,
        setter,
      ]);
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
    ], suffix: ";");
  }
}

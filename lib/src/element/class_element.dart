import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/field_element.dart';
import 'package:renderable/src/element/method_element.dart';
import 'package:renderable/src/element/property_accessor_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/element/type_parameterized_element.dart';
import 'package:renderable/src/type/interface_type.dart';
import 'package:renderable/src/util/template_utils.dart';

class ClassElement extends Renderable implements TypeParameterizedElement {
  /// is abstract class
  bool isAbstract;

  /// super class
  InterfaceType supertype;

  /// interface list
  List<InterfaceType> interfaces;

  /// field list
  List<FieldElement> fields;

  /// method list
  List<MethodElement> methods;

  /// accessor list
  List<PropertyAccessorElement> accessors;

  @override
  String name;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  bool isSynthetic;

  ClassElement({
    this.name,
    this.supertype,
    this.isAbstract = false,
    this.interfaces,
    this.fields,
    this.methods,
    this.typeParameters,
    this.isSynthetic = false,
  }) {
    interfaces ??= [];
    fields ??= [];
    methods ??= [];
    typeParameters ??= [];
  }

  @override
  String render() {
    return TemplateUtils.stringFromList([
      // build class wrapper
      TemplateUtils.stringFromList([
        if (isAbstract) "abstract",
        "class",
        name,
        typeParameters.isEmpty ? '' : '<${typeParameters.join(', ')}>',
        if (supertype != null) "extends $supertype",
        interfaces.isEmpty ? '' : ' implements ${interfaces.join(', ')}',
        "{"
      ], delimiter: " "),
      // build fields
      fields,
      // build methods
      methods,
      "}"
    ]);
  }
}

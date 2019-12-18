import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/field_element.dart';
import 'package:renderable/src/element/method_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/element/type_parameterized_element.dart';
import 'package:renderable/src/template/class_element_template.dart';
import 'package:renderable/src/type/interface_type.dart';
import 'package:renderable/src/type/parameterized_type.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

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

  @override
  String name;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  ParameterizedType type;

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
    return mu.render(
      class_element_template,
      {
        'name': name,
        'isAbstract': isAbstract,
        'supertype': supertype,
        'interfacesString': interfaces.isEmpty ? '' : ' implements ${interfaces.join(', ')}',
        'fields': fields,
        'methods': methods,
        'typeParametersString': typeParameters.isEmpty ? '' : '<${typeParameters.join(', ')}>',
      },
    );
  }
}

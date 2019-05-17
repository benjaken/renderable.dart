import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/field_render_element.dart';
import 'package:code_gen/src/element/method_render_element.dart';
import 'package:code_gen/src/element/type_parameter_render_element.dart';
import 'package:code_gen/src/element/type_parameterized_render_element.dart';
import 'package:code_gen/src/template/class_render_element_template.dart';
import 'package:code_gen/src/type/interface_render_type.dart';
import 'package:code_gen/src/type/parameterized_render_type.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class ClassRenderElement extends Renderable implements TypeParameterizedRenderElement {
  /// is abstract class
  bool isAbstract;

  /// super class
  InterfaceRenderType supertype;

  /// interface list
  List<InterfaceRenderType> interfaces;

  /// field list
  List<FieldRenderElement> fields;

  /// method list
  List<MethodRenderElement> methods;

  @override
  String name;

  @override
  List<TypeParameterRenderElement> typeParameters;

  @override
  ParameterizedRenderType type;

  ClassRenderElement({
    this.name,
    this.supertype,
    this.isAbstract = false,
    this.interfaces,
    this.fields,
    this.methods,
    this.typeParameters,
  }) {
    interfaces ??= [];
    fields ??= [];
    methods ??= [];
    typeParameters ??= [];
  }

  @override
  String render() {
    return mu.render(
      class_render_element_template,
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

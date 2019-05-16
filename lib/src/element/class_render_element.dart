import 'package:analyzer/dart/element/element.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/field_render_element.dart';
import 'package:code_gen/src/element/type_parameterized_render_element.dart';
import 'package:code_gen/src/template/class_render_element_template.dart';
import 'package:code_gen/src/type/interface_render_type.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class ClassRenderElement extends Renderable implements TypeParameterizedRenderElement {
  /// is abstract class
  bool isAbstract;

  /// super class
  InterfaceRenderType supertype;

  /// interface list
  List<InterfaceRenderType> interfaces;

  List<FieldRenderElement> fields;

  ClassRenderElement({
    this.name,
    this.supertype,
    this.isAbstract = false,
    this.interfaces,
    this.fields,
  }) {
    this.interfaces ??= [];
    this.fields ??= [];
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
      },
    );
  }

  @override
  String name;

  @override
  List<ElementAnnotation> metadata;
}

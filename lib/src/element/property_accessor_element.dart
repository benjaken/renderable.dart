import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/executable_element.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/property_inclucing_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/misc/function_body.dart';
import 'package:renderable/src/template/property_accessor_element_template.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/parameterized_type.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class PropertyAccessorElement extends Renderable implements ExecutableElement {
  bool isGetter;

  bool isSetter;

  PropertyAccessorElement correspondingGetter;

  PropertyAccessorElement correspondingSetter;

  PropertyInclucingElement variable;

  FunctionBody body;

  @override
  bool isAbstract = false;

  @override
  bool isAsynchronous = false;

  @override
  bool isExternal = false;

  @override
  bool isGenerator = false;

  @override
  bool isStatic;

  @override
  String name;

  @override
  List<ParameterElement> parameters;

  @override
  DartType returnType;

  @override
  ParameterizedType type;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  bool isSynthetic;

  PropertyAccessorElement({
    @required this.name,
    this.isGetter = false,
    this.isSetter = false,
    this.isStatic = false,
    this.body,
    this.parameters,
    this.returnType,
    this.type,
    this.typeParameters,
    this.isSynthetic,
  }) {
    parameters ??= [];
    typeParameters ??= [];
  }

  @override
  String render() {
    assert(!isSetter || !isGetter, 'Accessor can be only one of setter and getter.');

    mu.render(property_accessor_element_template, this);
  }
}

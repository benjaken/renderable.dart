import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/element/executable_element.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/property_inclucing_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/util/template_utils.dart';

class PropertyAccessorElement extends Renderable implements ExecutableElement {
  bool isGetter;

  bool isSetter;

  PropertyAccessorElement correspondingGetter;

  PropertyAccessorElement correspondingSetter;

  PropertyInclucingElement variable;

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

  @deprecated
  @override
  FunctionType type;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  bool isSynthetic;

  @override
  List<Statement> statements;

  PropertyAccessorElement({
    @required this.name,
    @required this.isGetter,
    @required this.isSetter,
    this.isStatic = false,
    this.parameters,
    this.returnType,
    this.typeParameters,
    this.isSynthetic = false,
    this.statements,
  }) {
    assert(isGetter != null && isSetter != null);
    assert(isGetter || isSetter);
    assert(!isGetter || !isSetter);
    parameters ??= [];
    typeParameters ??= [];
    statements ??= [];
  }

  @override
  String render() {
    assert(!isSetter || !isGetter, 'Accessor can be only one of setter and getter.');
    assert(isSetter || isGetter, 'Accessor must be one of setter and getter.');

    if (isSynthetic) {
      return "";
    }

    if (isGetter) {
      return TemplateUtils.stringFromList([
        TemplateUtils.stringFromList(
          [returnType, 'get', name, "{"],
          delimiter: " ",
        ),
        statements,
        "}"
      ]);
    } else {
      return TemplateUtils.stringFromList([
        TemplateUtils.stringFromList(
          ["set", name, "(", parameters, ")", "{"],
          delimiter: " ",
        ),
        statements,
        "}"
      ]);
    }
  }
}

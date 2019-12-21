import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/class_member_element.dart';
import 'package:renderable/src/element/executable_element.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/misc/function_body.dart';
import 'package:renderable/src/template/class_method_element_template.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/type/interface_type.dart';
import 'package:renderable/src/util/parameter_element_util.dart';
import 'package:renderable/src/util/string_utils.dart';
import 'package:renderable/src/util/template_utils.dart';

class MethodElement extends Renderable implements ClassMemberElement, ExecutableElement {
  @override
  bool isStatic;

  @override
  bool isAbstract;

  @override
  bool isAsynchronous;

  @override
  bool isExternal;

  @override
  bool isGenerator;

  @override
  String name;

  @override
  List<ParameterElement> parameters;

  @override
  DartType returnType;

  @override
  List<TypeParameterElement> typeParameters;

  @override
  FunctionType type = null;

  @override
  bool isSynthetic;

  MethodElement({
    @required this.name,
    this.returnType,
    this.isAbstract = false,
    this.isAsynchronous = false,
    this.isStatic = false,
    this.isExternal = false,
    this.isGenerator = false,
    this.typeParameters,
    this.parameters,
  }) {
    returnType ??= InterfaceType(name: 'dynamic');
    typeParameters ??= [];
    parameters ??= [];
  }

  @override
  String render() {
    String modifierString = TemplateUtils.generateModifiers(isStatic: isStatic);
    String functionModifierString = TemplateUtils.generateFunctionModifiers(
      isAsynchronous: isAsynchronous,
      isGenerator: isGenerator,
    );
    String typeParameterString = TemplateUtils.stringFromTypeParameters(typeParameters);
    String parameterString = TemplateUtils.stringFromParameters(parameters);
    String declarationString = TemplateUtils.stringFromList(
      [
        modifierString,
        returnType,
        name,
        typeParameterString,
        "(",
        parameterString,
        ")",
        functionModifierString,
      ],
      delimiter: " ",
    );

    if (isAbstract) {
      return StringUtils.append(declarationString, ";");
    }
    return TemplateUtils.stringFromList([
      // render declaration
      TemplateUtils.stringFromList([declarationString, "{"], delimiter: " "),
      // render concrete ending token
      "}"
    ]);
  }
}

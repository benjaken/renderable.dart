import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/element/class_member_element.dart';
import 'package:renderable/src/element/executable_element.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/type/interface_type.dart';
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

  @override
  List<Statement> statements;

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
    this.statements,
  }) {
    returnType ??= InterfaceType(name: 'dynamic');
    typeParameters ??= [];
    parameters ??= [];
    statements ??= [];
  }

  @override
  String render() {
    String modifierString = TemplateUtils.stringFromModifiers(isStatic: isStatic);
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
      statements,
      "}"
    ]);
  }
}

import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:code_gen/code_gen.dart';
import 'package:code_gen/src/converter/analyzer_import_loop_up.dart';
import 'package:code_gen/src/converter/analyzer_type_converter.dart';

class AnalyzerElementConverter {
  int id;

  AnalyzerTypeConverter analyzerTypeConverter;

  AnalyzerElementConverter(this.id) {
    analyzerTypeConverter = AnalyzerTypeConverter(id, this);
  }

  ImportElement parseImport(az.ImportElement import) {
    if (import?.uri == null) return null;

    List<String> shows = [];
    List<String> hides = [];
    import.combinators.forEach((e) {
      if (e is az.ShowElementCombinator) shows.addAll(e.shownNames);

      if (e is az.HideElementCombinator) hides.addAll(e.hiddenNames);
    });

    return ImportElement(
      path: import.uri,
      isDeferred: import.isDeferred,
      prefix: import.prefix?.name,
      hides: hides,
      shows: shows,
    );
  }

  ClassElement parseClass(az.ClassElement element) {
    if (element == null) return null;

    AnalyzerImportLoopUp.parse(element);

    return ClassElement(
      isAbstract: element.isAbstract,
      name: element.name,
      supertype: analyzerTypeConverter.parseDartType(element.supertype),
      interfaces: element.interfaces.map(analyzerTypeConverter.parseInterfaceType).toList(),
      typeParameters: element.typeParameters.map(parseTypeParameterElement).toList(),
      fields: element.fields.map(parseFieldElement).toList(),
      methods: element.methods.map(parseMethod).toList(),
    );
  }

  TypeParameterElement parseTypeParameterElement(az.TypeParameterElement type) {
    if (type == null) return null;

    return TypeParameterElement(
      name: type.name,
      bound: analyzerTypeConverter.parseDartType(type.bound),
    );
  }

  FieldElement parseFieldElement(az.FieldElement field) {
    return FieldElement(
      name: field.name,
      type: analyzerTypeConverter.parseDartType(field.type),
      isStatic: field.isStatic,
      isFinal: field.isFinal,
      isConst: field.isConst,
      value: null,
    );
  }

  MethodElement parseMethod(az.MethodElement method) {
    return MethodElement(
      isAbstract: method.isAbstract,
      isAsynchronous: method.isAsynchronous,
      isStatic: method.isStatic,
      isExternal: method.isExternal,
      isGenerator: method.isGenerator,
      name: method.name,
      returnType: analyzerTypeConverter.parseDartType(method.returnType),
      typeParameters: method.typeParameters.map(parseTypeParameterElement).toList(),
      parameters: method.parameters.map(parseParameter).toList(),
      body: null,
    );
  }

  ParameterElement parseParameter(az.ParameterElement parameter) {
    return ParameterElement(
      name: parameter.name,
      type: analyzerTypeConverter.parseDartType(parameter.type),
      isRequired: parameter.isNotOptional,
      isNamed: parameter.isNamed,
      isOptionalPositional: parameter.isOptionalPositional,
      hasRequired: parameter.hasRequired,
      defaultValue: parameter.defaultValueCode,
      typeParameters: parameter.typeParameters.map(parseTypeParameterElement).toList(),
//      parameters: parameter.parameters.map(parseParameter).toList(),
    );
  }
}

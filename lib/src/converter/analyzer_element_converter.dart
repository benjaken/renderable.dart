import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:renderable/renderable.dart';
import 'package:renderable/src/converter/analyzer_import_loop_up.dart';
import 'package:renderable/src/converter/analyzer_type_converter.dart';
import 'package:renderable/src/element/property_accessor_element.dart';

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

  List<ImportElement> parseImports(List<az.ImportElement> imports) {
    return imports.map(parseImport).where((e) => e != null).toList();
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
      methods: element.methods.map(parseMethodElement).toList(),
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
      isSynthetic: field.isSynthetic,
      value: null,
      getter: parsePropertyAccessorElement(field.getter),
      setter: parsePropertyAccessorElement(field.setter),
    );
  }

  MethodElement parseMethodElement(az.MethodElement method) {
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
      body: FunctionBody(),
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

  PropertyAccessorElement parsePropertyAccessorElement(az.PropertyAccessorElement accessor) {
    if (accessor == null) return null;

    return PropertyAccessorElement(
      name: accessor.displayName,
      isGetter: accessor.isGetter,
      isSetter: accessor.isSetter,
      isStatic: accessor.isSetter,
      parameters: accessor.parameters.map(parseParameter).toList(),
      returnType: analyzerTypeConverter.parseDartType(accessor.returnType),
//      typeParameters: accessor.typeParameters.map(parseTypeParameterElement).toList(),
    );
  }
}

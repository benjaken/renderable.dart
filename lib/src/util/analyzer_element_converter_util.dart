import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:code_gen/code_gen.dart';
import 'package:code_gen/src/util/analyzer_type_converter_util.dart';

class AnalyzerElementConverterUtil {
  static ImportElement parseImport(az.ImportElement import) {
    if (import?.uri == null) return null;

    List<String> shows = [];
    List<String> hides = [];
    import.combinators.forEach((e) {
      if (e is az.ShowElementCombinator) {
        shows.addAll(e.shownNames);
      }

      if (e is az.HideElementCombinator) {
        hides.addAll(e.hiddenNames);
      }
    });

    return ImportElement(
      path: import.uri,
      isDeferred: import.isDeferred,
      prefix: import.prefix?.name,
      hides: hides,
      shows: shows,
    );
  }

  static ClassElement parseClass(az.ClassElement element) {
    if (element == null) return null;

    return ClassElement(
      isAbstract: element.isAbstract,
      name: element.name,
      supertype: AnalyzerTypeConverterUtil.parseDartType(element.supertype),
      interfaces: element.interfaces.map(AnalyzerTypeConverterUtil.parseInterfaceType).toList(),
      typeParameters: element.typeParameters.map(parseTypeParameterElement).toList(),
      fields: element.fields.map(parseFieldElement).toList(),
    );
  }

  static TypeParameterElement parseTypeParameterElement(az.TypeParameterElement type) {
    if (type == null) return null;

    return TypeParameterElement(
      name: type.name,
      bound: AnalyzerTypeConverterUtil.parseDartType(type.bound),
    );
  }

  static FieldElement parseFieldElement(az.FieldElement field) {
    return FieldElement(
      name: field.name,
      type: AnalyzerTypeConverterUtil.parseDartType(field.type),
      isStatic: field.isStatic,
      isFinal: field.isFinal,
      isConst: field.isConst,
      value: null,
    );
  }
}

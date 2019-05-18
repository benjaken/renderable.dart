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
}

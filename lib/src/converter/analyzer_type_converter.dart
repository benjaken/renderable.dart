import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:code_gen/code_gen.dart';
import 'package:code_gen/src/converter/analyzer_import_loop_up.dart';

class AnalyzerTypeConverter {
  int id;

  AnalyzerElementConverter analyzerElementConverter;

  AnalyzerTypeConverter(this.id, this.analyzerElementConverter);

  InterfaceType parseInterfaceType(az.InterfaceType type) {
    return InterfaceType(
      name: type.name,
      prefix: AnalyzerImportLoopUp.getPrefix(id, type.element.library.id),
      typeArguments: type.typeArguments.map(parseDartType).toList(),
      typeParameters:
          type.typeParameters.map(analyzerElementConverter.parseTypeParameterElement).toList(),
    );
  }

  DartType parseDartType(az.DartType type) {
    if (type == null) return null;

    if (type is az.FunctionType) {
      return null;
    }

    if (type is az.InterfaceType) {
      return parseInterfaceType(type);
    }

    if (type is az.ParameterizedType) {
      return ParameterizedType(
        name: type.name,
        prefix: AnalyzerImportLoopUp.getPrefix(id, type.element.library.id),
        typeArguments: type.typeArguments.map(parseDartType).toList(),
        typeParameters:
            type.typeParameters.map(analyzerElementConverter.parseTypeParameterElement).toList(),
      );
    }

    if (type is az.TypeParameterType) {
      return null;
    }

    return DartType(
      name: type.name,
    );
  }
}

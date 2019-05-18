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

  ParameterizedType parseParameterizedType(az.ParameterizedType type) {
    return ParameterizedType(
      name: type.name,
      prefix: AnalyzerImportLoopUp.getPrefix(id, type.element.library.id),
      typeArguments: type.typeArguments.map(parseDartType).toList(),
      typeParameters:
          type.typeParameters.map(analyzerElementConverter.parseTypeParameterElement).toList(),
    );
  }

  FunctionType parseFunctionType(az.FunctionType type) {
    return FunctionType(
      name: type.name,
      parameters: type.parameters.map(analyzerElementConverter.parseParameter).toList(),
      returnType: parseDartType(type.returnType),
      typeParameters:
          type.typeParameters.map(analyzerElementConverter.parseTypeParameterElement).toList(),
    );
  }

  DartType parseDartType(az.DartType type) {
    if (type == null) return null;

    if (type is az.FunctionType) {
      return parseFunctionType(type);
    }

    if (type is az.InterfaceType) {
      return parseInterfaceType(type);
    }

    if (type is az.ParameterizedType) {
      return parseParameterizedType(type);
    }

    if (type is az.TypeParameterType) {
      return null;
    }

    return DartType(
      name: type.name,
    );
  }
}

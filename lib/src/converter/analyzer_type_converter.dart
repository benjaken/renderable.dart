import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:renderable/renderable.dart';
import 'package:renderable/src/converter/analyzer_import_loop_up.dart';
import 'package:renderable/src/type/type_parameter_type.dart';

class AnalyzerTypeConverter {
  int id;

  AnalyzerElementConverter analyzerElementConverter;

  AnalyzerTypeConverter(this.id, this.analyzerElementConverter);

  InterfaceType parseInterfaceType(az.InterfaceType type) {
    return InterfaceType(
      name: type.name,
      prefix: AnalyzerImportLoopUp.getPrefix(id, type.element.library.id),
      typeArguments: type.typeArguments.map(parseDartType).where((e) => e != null).toList(),
      typeParameters: type.typeParameters
          .map(analyzerElementConverter.parseTypeParameterElement)
          .where((e) => e != null)
          .toList(),
    );
  }

  ParameterizedType parseParameterizedType(az.ParameterizedType type) {
    return ParameterizedType(
      name: type.name,
      prefix: AnalyzerImportLoopUp.getPrefix(id, type.element.library.id),
      typeArguments: type.typeArguments.map(parseDartType).where((e) => e != null).toList(),
      typeParameters: type.typeParameters
          .map(analyzerElementConverter.parseTypeParameterElement)
          .where((e) => e != null)
          .toList(),
    );
  }

  FunctionType parseFunctionType(az.FunctionType type) {
    return FunctionType(
      name: type.name,
      parameters: type.parameters
          .map(analyzerElementConverter.parseParameter)
          .where((e) => e != null)
          .toList(),
      returnType: parseDartType(type.returnType),
      typeParameters: type.typeParameters
          .map(analyzerElementConverter.parseTypeParameterElement)
          .where((e) => e != null)
          .toList(),
    );
  }

  TypeParameterType parseTypeParameterType(az.TypeParameterType type) {
    return TypeParameterType(
      name: type.name,
      bound: parseDartType(type.bound),
    );
  }

  DartType parseDartType(az.DartType type) {
    if (type == null) return null;
//    if (type.isDynamic) return null;

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
      return parseTypeParameterType(type);
    }

    return DartType(
      name: type.name,
    );
  }

  static TypeParameterType parseTypeArgumentFromTypeParameter(TypeParameterElement element) {
    return TypeParameterType(
      name: element.name,
      bound: element.bound,
    );
  }
}

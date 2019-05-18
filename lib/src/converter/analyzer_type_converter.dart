import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:code_gen/code_gen.dart';

class AnalyzerTypeConverter {
  static InterfaceType parseInterfaceType(az.InterfaceType type) {
    return InterfaceType(
      name: type.name,
      prefix: null,
      typeArguments: type.typeArguments.map(parseDartType).toList(),
      typeParameters:
          type.typeParameters.map(AnalyzerElementConverter.parseTypeParameterElement).toList(),
    );
  }

  static DartType parseDartType(az.DartType type) {
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
        prefix: null,
        typeArguments: type.typeArguments.map(parseDartType).toList(),
        typeParameters:
            type.typeParameters.map(AnalyzerElementConverter.parseTypeParameterElement).toList(),
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

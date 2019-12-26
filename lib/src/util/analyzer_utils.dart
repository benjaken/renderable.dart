import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:renderable/src/element/class_element.dart';
import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/element/export_element.dart';
import 'package:renderable/src/element/field_element.dart';
import 'package:renderable/src/element/import_element.dart';
import 'package:renderable/src/element/library_element.dart';
import 'package:renderable/src/element/method_element.dart';
import 'package:renderable/src/element/namespace_combinator.dart';
import 'package:renderable/src/element/parameter_element.dart';
import 'package:renderable/src/element/property_accessor_element.dart';
import 'package:renderable/src/element/type_parameter_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/type/function_type.dart';
import 'package:renderable/src/type/interface_type.dart';
import 'package:renderable/src/type/parameterized_type.dart';
import 'package:renderable/src/type/type_parameter_type.dart';

abstract class AnalyzerUtils {
  static analyzer.LibraryElement currentResolvingLibraryElement;

  static LibraryElement parseLibraryElement(analyzer.LibraryElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element;

    return LibraryElement(
      name: element.name,
      imports: element.imports.map(parseImportElement).toList(),
      exports: element.exports.map(parseExportElement).toList(),
      topLevelElements: element.topLevelElements.map(parseElement).toList(),
    );
  }

  static Element parseElement(analyzer.Element element) {
    if (element is analyzer.LibraryElement) {
      return parseLibraryElement(element);
    } else if (element is analyzer.ImportElement) {
      return parseImportElement(element);
    } else if (element is analyzer.ExportElement) {
      return parseExportElement(element);
    } else if (element is analyzer.FunctionElement) {
      return null;
    } else if (element is analyzer.ClassElement) {
      return parseClassElement(element);
    } else if (element is analyzer.FieldElement) {
      return parseFieldElement(element);
    } else if (element is analyzer.MethodElement) {
      return parseMethodElement(element);
    } else if (element is analyzer.PropertyAccessorElement) {
      return parsePropertyAccessorElement(element);
    } else if (element is analyzer.ParameterElement) {
      return parseParameterElement(element);
    } else if (element is analyzer.TypeParameterElement) {
      return parseTypeParameterElement(element);
    } else {
      return null;
    }
  }

  //---------------------------------------------------------------------
  // Class related
  //---------------------------------------------------------------------

  static ClassElement parseClassElement(analyzer.ClassElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return ClassElement(
      name: element.name,
      supertype: parseDartType(element.supertype) as InterfaceType,
      isAbstract: element.isAbstract,
      fields: element.fields.map(parseFieldElement).toList(),
      methods: element.methods.map(parseMethodElement).toList(),
      accessors: element.accessors.map(parsePropertyAccessorElement).toList(),
      typeParameters: element.typeParameters.map(parseTypeParameterElement).toList(),
      isSynthetic: element.isSynthetic,
    );
  }

  static FieldElement parseFieldElement(analyzer.FieldElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return FieldElement(
      name: element.name,
      isFinal: element.isFinal,
      isConst: element.isConst,
      isStatic: element.isStatic,
      isSynthetic: element.isSynthetic,
      type: parseDartType(element.type),
      value: null,
    );
  }

  static MethodElement parseMethodElement(analyzer.MethodElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return MethodElement(
      name: element.name,
      returnType: parseDartType(element.returnType),
      isStatic: element.isStatic,
      isAbstract: element.isAbstract,
      isGenerator: element.isGenerator,
      isAsynchronous: element.isAsynchronous,
      isExternal: element.isExternal,
      typeParameters: element.typeParameters.map(parseTypeParameterElement).toList(),
      parameters: element.parameters.map(parseParameterElement).toList(),
      statements: [],
    );
  }

  static PropertyAccessorElement parsePropertyAccessorElement(
      analyzer.PropertyAccessorElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return PropertyAccessorElement(
      name: element.displayName,
      isGetter: element.isGetter,
      isSetter: element.isSetter,
      isStatic: element.isStatic,
      parameters: element.parameters.map(parseParameterElement).toList(),
      returnType: parseDartType(element.returnType),
      typeParameters: element.typeParameters.map(parseTypeParameterElement).toList(),
      isSynthetic: element.isSynthetic,
      statements: [],
    );
  }

  //---------------------------------------------------------------------
  // Import/Export related
  //---------------------------------------------------------------------
  static ImportElement parseImportElement(analyzer.ImportElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return ImportElement(
      uri: element.uri,
      prefix: element.prefix?.name,
      isDeferred: element.isDeferred,
      combinators: element.combinators.map(parseNamespaceCombinator).toList(),
    );
  }

  static ExportElement parseExportElement(analyzer.ExportElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return ExportElement(
      uri: element.uri,
      combinators: element.combinators.map(parseNamespaceCombinator).toList(),
    );
  }

  static NamespaceCombinator parseNamespaceCombinator(analyzer.NamespaceCombinator combinator) {
    if (combinator is analyzer.ShowElementCombinator) {
      return ShowElementCombinator(shownNames: combinator.shownNames);
    } else if (combinator is analyzer.HideElementCombinator) {
      return HideElementCombinator(hiddenNames: combinator.hiddenNames);
    } else {
      return null;
    }
  }

  //---------------------------------------------------------------------
  // Parameter related
  //---------------------------------------------------------------------

  static ParameterElement parseParameterElement(analyzer.ParameterElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return ParameterElement(
      name: element.name,
      type: parseDartType(element.type),
      isRequired: element.isRequiredPositional,
      isNamed: element.isNamed,
      isOptionalPositional: element.isOptionalPositional,
      defaultValue: null,
      typeParameters: element.typeParameters.map(parseTypeParameterElement).toList(),
      parameters: element.parameters.map(parseParameterElement).toList(),
    );
  }

  static TypeParameterElement parseTypeParameterElement(analyzer.TypeParameterElement element) {
    if (element == null) return null;

    currentResolvingLibraryElement = element.library;

    return TypeParameterElement(
      name: element.name,
      bound: parseDartType(element.bound),
    );
  }

  //---------------------------------------------------------------------
  // Type related
  //---------------------------------------------------------------------

  static FunctionType parseFunctionType(analyzer.FunctionType type) {
    if (type == null) return null;

    return FunctionType(
      name: type.name,
      parameters: type.parameters.map(parseParameterElement).where((e) => e != null).toList(),
      returnType: parseDartType(type.returnType),
      typeParameters:
          type.typeFormals.map(parseTypeParameterElement).where((e) => e != null).toList(),
    );
  }

  static InterfaceType parseInterfaceType(analyzer.InterfaceType type, [String prefix]) {
    if (type == null) return null;

    return InterfaceType(
      name: type.name,
      prefix: prefix,
      typeArguments: type.typeArguments.map(parseDartType).where((e) => e != null).toList(),
      typeParameters:
          type.typeParameters.map(parseTypeParameterElement).where((e) => e != null).toList(),
    );
  }

  static ParameterizedType parseParameterizedType(analyzer.ParameterizedType type,
      [String prefix]) {
    if (type == null) return null;

    return ParameterizedType(
      name: type.displayName,
      prefix: prefix,
      typeArguments: type.typeArguments.map(parseDartType).where((e) => e != null).toList(),
      typeParameters:
          type.typeParameters.map(parseTypeParameterElement).where((e) => e != null).toList(),
    );
  }

  static TypeParameterType parseTypeParameterType(analyzer.TypeParameterType type) {
    if (type == null) return null;

    return TypeParameterType(
      name: type.name,
      bound: parseDartType(type.bound),
    );
  }

  static DartType parseDartType(analyzer.DartType type) {
    if (type == null) return null;

    String prefix = getPrefixFromElement(type.element?.library);

    if (type is analyzer.FunctionType) {
      return parseFunctionType(type);
    }

    if (type is analyzer.InterfaceType) {
      return parseInterfaceType(type, prefix);
    }

    if (type is analyzer.ParameterizedType) {
      return parseParameterizedType(type, prefix);
    }

    if (type is analyzer.TypeParameterType) {
      return parseTypeParameterType(type);
    }

    return DartType(name: type.name, prefix: prefix);
  }

  static String getPrefixFromElement(analyzer.LibraryElement searchingElement) {
    if (currentResolvingLibraryElement == null || searchingElement == null) {
      return null;
    }

    final searchingLibraryId = searchingElement.id;
    String outputPrefix;

    for (var import in currentResolvingLibraryElement.imports) {
      String prefix = import.prefix?.name;
      int importedLibraryId = import.importedLibrary.id;

      if (importedLibraryId == searchingLibraryId) {
        outputPrefix = prefix;
        if (outputPrefix == null) {
          continue;
        }
        break;
      }

      for (var export in import.importedLibrary.exportedLibraries) {
        if (export.id == searchingLibraryId) {
          outputPrefix = prefix;
          break;
        }
      }
    }

    return outputPrefix;
  }
}

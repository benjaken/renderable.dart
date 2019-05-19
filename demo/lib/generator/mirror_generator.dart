import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:build/build.dart';
import 'package:demo/annotation/mirror.dart';
import 'package:source_gen/source_gen.dart';
import 'package:renderable/renderable.dart';

class MirrorGenerator extends GeneratorForAnnotation<Mirror> {
  static Map<String, bool> firstCheck = {};

  static Map<int, String> idPrefixDict = {};

  @override
  generateForAnnotatedElement(az.Element element, ConstantReader annotation, BuildStep buildStep) {
    /// render import only one time
    List<ImportElement> imports = firstCheck[buildStep.inputId.uri.toString()] == true
        ? []
        : element.library.imports
            .map(AnalyzerElementConverter(element.library.id).parseImport)
            .where((e) => e != null)
            .toList();

//    if (element is az.ClassElement) {
//      if (firstCheck[buildStep.inputId.uri.toString()] != true) {
//        element.library.imports.forEach((e) {
//          String prefix = e.prefix?.name;
//          idPrefixDict[e.importedLibrary.id] = prefix;
//          e.importedLibrary.exportedLibraries.forEach((e) {
//            idPrefixDict[e.id] = prefix;
//          });
//        });
//      }
//
//      element.fields.forEach((e) {
//        print('${e.name}: ${idPrefixDict[e.type.element.library.id]}');
//      });
//    }

    firstCheck[buildStep.inputId.uri.toString()] = true;

    return FileElement(
      imports: imports,
      renders: [
        AnalyzerElementConverter(element.library.id).parseClass(element),
      ],
    ).render();
  }
}

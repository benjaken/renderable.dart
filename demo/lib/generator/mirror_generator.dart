import 'package:analyzer/dart/element/element.dart' as el;
import 'package:build/build.dart';
import 'package:demo/annotation/mirror.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_gen/code_gen.dart';

class MirrorGenerator extends GeneratorForAnnotation<Mirror> {
  static Map<String, bool> firstCheck = {};

  @override
  generateForAnnotatedElement(el.Element element, ConstantReader annotation, BuildStep buildStep) {
    List<ImportElement> imports = firstCheck[buildStep.inputId.uri.toString()] == true
        ? []
        : element.library.imports
            .map(AnalyzerElementConverterUtil.parseImport)
            .where((e) => e != null)
            .toList();

    firstCheck[buildStep.inputId.uri.toString()] = true;

    return FileElement(
      imports: imports,
      renders: [
        AnalyzerElementConverterUtil.parseClass(element),
      ],
    ).render();
  }
}

import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:build/build.dart';
import 'package:demo/annotation/mirror.dart';
import 'package:renderable/renderable.dart';
import 'package:source_gen/source_gen.dart';

class MirrorGenerator extends GeneratorForAnnotation<Mirror> {
  @override
  generateForAnnotatedElement(az.Element element, ConstantReader annotation, BuildStep buildStep) {
    return AnalyzerUtils.parseElement(element).render();
  }
}

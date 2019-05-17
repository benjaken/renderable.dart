import 'package:analyzer/dart/element/element.dart' as el;
import 'package:build/build.dart';
import 'package:demo/annotation/mirror.dart';
import 'package:source_gen/source_gen.dart';

class MirrorGenerator extends GeneratorForAnnotation<Mirror> {
  @override
  generateForAnnotatedElement(el.Element element, ConstantReader annotation, BuildStep buildStep) {}
}

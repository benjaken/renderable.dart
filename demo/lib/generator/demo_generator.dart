import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:build/build.dart';
import 'package:demo/annotation/mirror.dart';
import 'package:source_gen/source_gen.dart';
import 'package:renderable/renderable.dart';

class DemoGenerator extends GeneratorForAnnotation<Mirror> {
  @override
  generateForAnnotatedElement(az.Element element, ConstantReader annotation, BuildStep buildStep) {
    element.library.imports.forEach((e) => print(e.name));
    return LibraryElement(
      imports: [
        ImportElement(
          uri: "dart:core",
        ),
      ],
      exports: [
        ExportElement(
          uri: "dart:collection",
          combinators: [
            ShowElementCombinator([
              "ListQueue",
            ]),
            ShowElementCombinator([
              "ListMixin",
              "ListBase",
            ]),
            HideElementCombinator([
              "MapMixin",
              "MapBase",
              "MapView",
            ]),
          ],
        ),
      ],
      topLevelElements: [],
    ).render();
  }
}

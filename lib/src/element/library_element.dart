import 'package:renderable/renderable.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/element/export_element.dart';
import 'package:renderable/src/element/import_element.dart';
import 'package:renderable/src/util/template_utils.dart';

class LibraryElement extends Renderable implements Element {
  @override
  bool isSynthetic;

  @override
  String name;

  List<ImportElement> imports;

  List<ExportElement> exports;

  List<Element> topLevelElements;

  List<dynamic> parts;

  LibraryElement({
    this.name,
    this.imports,
    this.exports,
    this.topLevelElements,
  });

  @override
  String render() {
    return TemplateUtils.stringFromList([
      if (name != null) "library $name",
      imports,
      exports,
      topLevelElements,
    ]);
  }
}

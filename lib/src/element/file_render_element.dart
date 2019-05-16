import 'dart:io';

import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/writable.dart';
import 'package:code_gen/src/element/import_render_element.dart';
import 'package:meta/meta.dart';

class FileRenderElement extends Renderable implements Writable {
  String filePath;

  File get file => File(filePath);

  List<ImportRenderElement> imports;
  List<Renderable> renders;

  FileRenderElement({
    @required this.filePath,
    this.renders,
    this.imports,
  }) {
    this.imports ??= [];
    this.renders ??= [];
  }

  @override
  void writeToFile() {
    file.writeAsStringSync(render());
  }

  @override
  String render() {
    return '${imports.join('\n')}\n\n${renders.join('\n')}';
  }
}

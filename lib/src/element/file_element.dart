import 'dart:io';

import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/writable.dart';
import 'package:code_gen/src/element/import_element.dart';

class FileElement extends Renderable implements Writable {
  String filePath;

  File get file => File(filePath);

  List<ImportElement> imports;
  List<Renderable> renders;

  FileElement({
    this.filePath,
    this.renders,
    this.imports,
  }) {
    this.imports ??= [];
    this.renders ??= [];
  }

  @override
  void writeToFile() {
    assert(filePath != null, 'You must provide a filePath to write.');

    file.writeAsStringSync(render());
  }

  @override
  String render() {
    return '${imports.join('\n')}\n\n${renders.join('\n')}';
  }
}

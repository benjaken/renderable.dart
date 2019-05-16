import 'dart:io';

import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/writable.dart';

class FileRenderElement extends Renderable implements Writable {
  String filePath;

  File get file => File(filePath);

  List<Renderable> renders;

  FileRenderElement({
    this.filePath,
    List<Renderable> renders,
  }) {
    this.renders = renders ?? [];
  }

  @override
  void writeToFile() {
    file.writeAsStringSync(render());
  }

  @override
  String render() {
    return renders.map((e) => e.render()).join('\n');
  }
}

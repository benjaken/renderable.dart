import 'dart:io';

import 'package:code_gen/code_gen.dart';
import 'package:code_gen/src/element/file_render_element.dart';

main() {
  FileRenderElement(
    filePath: 'example/code_gen_example.generated.dart',
    renders: [
      ClassRenderElement(
        name: 'CodeGenExampleInterface1',
        isAbstract: true,
      ),
      ClassRenderElement(
        name: 'CodeGenExampleInterface2',
        isAbstract: true,
      ),
      ClassRenderElement(
        name: 'CodeGenExampleInterface3',
        isAbstract: true,
      ),
      ClassRenderElement(
        name: 'CodeGenExampleBase',
      ),
      ClassRenderElement(
        name: 'CodeGenExample',
        supertype: InterfaceRenderType(name: 'CodeGenExampleBase'),
        interfaces: [
          InterfaceRenderType(name: 'CodeGenExampleInterface1'),
          InterfaceRenderType(name: 'CodeGenExampleInterface2'),
          InterfaceRenderType(name: 'CodeGenExampleInterface3'),
        ],
      ),
    ],
  ).writeToFile();
  print('render complete');
}

import 'dart:io';

import 'package:renderable/renderable.dart';
import 'package:renderable/src/element/file_element.dart';

main() {
  FileElement(
    filePath: 'example/generated/renderable_example.generated.dart',
    renders: [
      ClassElement(
        name: 'CodeGenExampleInterface1',
        isAbstract: true,
      ),
      ClassElement(
        name: 'CodeGenExampleInterface2',
        isAbstract: true,
      ),
      ClassElement(
        name: 'CodeGenExampleInterface3',
        isAbstract: true,
      ),
      ClassElement(
        name: 'CodeGenExampleBase',
      ),
      ClassElement(
        name: 'CodeGenExample',
        supertype: InterfaceType(name: 'CodeGenExampleBase'),
        interfaces: [
          InterfaceType(name: 'CodeGenExampleInterface1'),
          InterfaceType(name: 'CodeGenExampleInterface2'),
          InterfaceType(name: 'CodeGenExampleInterface3'),
        ],
        fields: [
          FieldElement(
            name: 'basicField',
          ),
          FieldElement(
            isFinal: true,
            name: 'fieldWithModifier1',
            type: InterfaceType(name: 'int'),
            value: RawElement(raw: '1'),
          ),
        ],
      ),
    ],
  ).writeToFile();
  print('render complete');
}

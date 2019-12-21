import 'package:renderable/renderable.dart';

main() {
  var library = LibraryElement(
    topLevelElements: [
      ClassElement(
        name: 'RenderableExampleInterface1',
        isAbstract: true,
      ),
      ClassElement(
        name: 'RenderableExampleInterface2',
        isAbstract: true,
      ),
      ClassElement(
        name: 'RenderableExampleInterface3',
        isAbstract: true,
      ),
      ClassElement(
        name: 'RenderableExampleBase',
      ),
      ClassElement(
        name: 'RenderableExample',
        supertype: InterfaceType(name: 'RenderableExampleBase'),
        interfaces: [
          InterfaceType(name: 'RenderableExampleInterface1'),
          InterfaceType(name: 'RenderableExampleInterface2'),
          InterfaceType(name: 'RenderableExampleInterface3'),
        ],
        fields: [
          FieldElement(
            name: 'basicField',
          ),
          FieldElement(
            isFinal: true,
            name: 'fieldWithModifier1',
            type: InterfaceType(name: 'int'),
            value: RawElement('1'),
          ),
        ],
      ),
    ],
  );
  FileUtils.writeLibraryToFile(
    library,
    "example/generated/renderable_example.generated.dart",
  );

  print('render complete');
}

import 'package:renderable/renderable.dart';

void main() {
  var library = LibraryElement(
    topLevelElements: [
      ClassElement(
        name: 'ClassExample1',
      ),
      ClassElement(
        isAbstract: true,
        name: 'ClassExample2',
      ),
      ClassElement(
        isAbstract: true,
        name: 'ClassExample3',
        supertype: InterfaceType(name: 'Object'),
      ),
      ClassElement(
        isAbstract: true,
        name: 'ClassExample4',
        supertype: InterfaceType(name: 'Object'),
      ),
      ClassElement(
        isAbstract: true,
        name: 'ClassExample5',
        supertype: InterfaceType(name: 'Object'),
        interfaces: [
          InterfaceType(name: 'ClassExample3'),
          InterfaceType(name: 'ClassExample4'),
        ],
      ),
      ClassElement(
        isAbstract: true,
        name: 'ClassExample6',
        supertype: InterfaceType(name: 'Object'),
        interfaces: [
          InterfaceType(name: 'ClassExample3'),
          InterfaceType(name: 'ClassExample4'),
        ],
        typeParameters: [
          TypeParameterElement(name: 'T', bound: DartType.map),
          TypeParameterElement(name: 'S'),
        ],
      ),
    ],
  );

  FileUtils.writeLibraryToFile(
    library,
    "example/generated/renderable_class_example.generated.dart",
  );
}

import 'package:code_gen/code_gen.dart';

void main() {
  FileRenderElement(
    filePath: 'example/generated/code_gen_class_example.generated.dart',
    renders: [
      ClassRenderElement(
        name: 'ClassExample1',
      ),
      ClassRenderElement(
        isAbstract: true,
        name: 'ClassExample2',
      ),
      ClassRenderElement(
        isAbstract: true,
        name: 'ClassExample3',
        supertype: InterfaceRenderType(name: 'Object'),
      ),
      ClassRenderElement(
        isAbstract: true,
        name: 'ClassExample4',
        supertype: InterfaceRenderType(name: 'Object'),
      ),
      ClassRenderElement(
        isAbstract: true,
        name: 'ClassExample5',
        supertype: InterfaceRenderType(name: 'Object'),
        interfaces: [
          InterfaceRenderType(name: 'ClassExample3'),
          InterfaceRenderType(name: 'ClassExample4'),
        ],
      ),
      ClassRenderElement(
        isAbstract: true,
        name: 'ClassExample6',
        supertype: InterfaceRenderType(name: 'Object'),
        interfaces: [
          InterfaceRenderType(name: 'ClassExample3'),
          InterfaceRenderType(name: 'ClassExample4'),
        ],
        typeParameters: [
          TypeParameterRenderElement(name: 'T'),
          TypeParameterRenderElement(name: 'S'),
        ],
      ),
    ],
  ).writeToFile();
}

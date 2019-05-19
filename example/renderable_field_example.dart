import 'package:renderable/renderable.dart';

void main() {
  FileElement(
    filePath: 'example/generated/renderable_field_example.generated.dart',
    imports: [
      ImportElement(path: '../misc/some_file.dart', prefix: 'sf'),
    ],
    renders: [
      ClassElement(
        name: 'RenderableFieldExample',
        fields: [
          FieldElement(name: 'simpleField'),
          FieldElement(
            name: 'finalField',
            isFinal: true,
            value: RawElement(raw: '1'),
          ),
          FieldElement(
            name: 'staticConstField',
            isStatic: true,
            isConst: true,
            value: RawElement(raw: '1'),
          ),
          FieldElement(name: 'staticField', isStatic: true),
          FieldElement(
              name: 'staticFinalField', isStatic: true, isFinal: true, value: RawElement(raw: '1')),
          FieldElement(
            name: 'typedField',
            type: InterfaceType(name: 'Object'),
          ),
          FieldElement(
            name: 'classTypedField',
            type: InterfaceType(name: 'SomeFile', prefix: 'sf'),
          ),
          FieldElement(
            name: 'staticFinalClassTypedField',
            isStatic: true,
            isFinal: true,
            type: InterfaceType(name: 'SomeFile', prefix: 'sf'),
            value: RawElement(raw: 'sf.SomeFile()'),
          ),
          FieldElement(
            name: 'simpleGenericField',
            isStatic: true,
            isFinal: true,
            type: InterfaceType(
              name: 'SomeFile',
              prefix: 'sf',
              typeArguments: [
                InterfaceType(name: 'String'),
                InterfaceType(name: 'SomeFile2', prefix: 'sf'),
              ],
            ),
            value: RawElement(raw: 'sf.SomeFile()'),
          ),
          FieldElement(
            name: 'complexGenericField',
            isStatic: true,
            isFinal: true,
            type: InterfaceType(
              name: 'SomeFile',
              prefix: 'sf',
              typeArguments: [
                InterfaceType(
                  name: 'Map',
                  typeArguments: [
                    InterfaceType(
                      name: 'List',
                      typeArguments: [
                        InterfaceType(
                          name: 'double',
                        ),
                      ],
                    ),
                    InterfaceType(
                      name: 'int',
                    ),
                  ],
                ),
                InterfaceType(name: 'String'),
              ],
            ),
            value: RawElement(raw: 'sf.SomeFile()'),
          ),
//          FieldElement(
//            name: 'complexGenericField',
//            isStatic: true,
//            isFinal: true,
//            type: InterfaceType(name: 'SomeFile', prefix: 'sf'),
//            value: RawElement(raw: 'sf.SomeFile()'),
//          ),
        ],
      )
    ],
  ).writeToFile();
}

import 'package:code_gen/code_gen.dart';

void main() {
  FileRenderElement(
    filePath: 'example/generated/code_gen_field_example.generated.dart',
    imports: [
      ImportRenderElement(path: '../misc/some_file.dart', prefix: 'sf'),
    ],
    renders: [
      ClassRenderElement(
        name: 'CodeGenFieldExample',
        fields: [
          FieldRenderElement(name: 'simpleField'),
          FieldRenderElement(
            name: 'finalField',
            isFinal: true,
            value: RawRenderElement(raw: '1'),
          ),
          FieldRenderElement(
            name: 'staticConstField',
            isStatic: true,
            isConst: true,
            value: RawRenderElement(raw: '1'),
          ),
          FieldRenderElement(name: 'staticField', isStatic: true),
          FieldRenderElement(
              name: 'staticFinalField',
              isStatic: true,
              isFinal: true,
              value: RawRenderElement(raw: '1')),
          FieldRenderElement(
            name: 'typedField',
            type: InterfaceRenderType(name: 'Object'),
          ),
          FieldRenderElement(
            name: 'classTypedField',
            type: InterfaceRenderType(name: 'SomeFile', prefix: 'sf'),
          ),
          FieldRenderElement(
            name: 'staticFinalClassTypedField',
            isStatic: true,
            isFinal: true,
            type: InterfaceRenderType(name: 'SomeFile', prefix: 'sf'),
            value: RawRenderElement(raw: 'sf.SomeFile()'),
          ),
          FieldRenderElement(
            name: 'simpleGenericField',
            isStatic: true,
            isFinal: true,
            type: InterfaceRenderType(
              name: 'SomeFile',
              prefix: 'sf',
              typeArguments: [
                InterfaceRenderType(name: 'String'),
                InterfaceRenderType(name: 'SomeFile2', prefix: 'sf'),
              ],
            ),
            value: RawRenderElement(raw: 'sf.SomeFile()'),
          ),
          FieldRenderElement(
            name: 'complexGenericField',
            isStatic: true,
            isFinal: true,
            type: InterfaceRenderType(
              name: 'SomeFile',
              prefix: 'sf',
              typeArguments: [
                InterfaceRenderType(
                  name: 'Map',
                  typeArguments: [
                    InterfaceRenderType(
                      name: 'List',
                      typeArguments: [
                        InterfaceRenderType(
                          name: 'double',
                        ),
                      ],
                    ),
                    InterfaceRenderType(
                      name: 'int',
                    ),
                  ],
                ),
                InterfaceRenderType(name: 'String'),
              ],
            ),
            value: RawRenderElement(raw: 'sf.SomeFile()'),
          ),
//          FieldRenderElement(
//            name: 'complexGenericField',
//            isStatic: true,
//            isFinal: true,
//            type: InterfaceRenderType(name: 'SomeFile', prefix: 'sf'),
//            value: RawRenderElement(raw: 'sf.SomeFile()'),
//          ),
        ],
      )
    ],
  ).writeToFile();
}

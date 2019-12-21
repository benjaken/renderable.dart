import 'package:renderable/renderable.dart';

void main() {
  var library = LibraryElement(
    topLevelElements: [
      ClassElement(
        name: 'RenderableValue',
        fields: [
          FieldElement(
            name: 'nullValue',
            type: DartType.var_,
            value: NullValue(),
          ),
          FieldElement(
            name: 'intValue',
            type: DartType.int,
            value: IntValue(123),
          ),
          FieldElement(
            name: 'doubleValue',
            type: DartType.double,
            value: DoubleValue(1.23),
          ),
          FieldElement(
            name: 'numValue',
            type: DartType.num,
            value: NumValue(1233),
          ),
          FieldElement(
            name: 'boolValue',
            type: DartType.bool,
            value: BoolValue.True,
          ),
          FieldElement(
            name: 'listValue',
            type: DartType.list,
            value: ListValue([
              IntValue(1),
              IntValue(2),
              IntValue(3),
            ]),
          ),
          FieldElement(
            name: 'listValue2',
            type: DartType.list,
            value: ListValue([
              StringValue('1'),
              StringValue('2'),
              StringValue('3'),
            ]),
          ),
          FieldElement(
            name: 'mapValue',
            type: DartType.map,
            value: MapValue({
              StringValue('key'): DoubleValue(1.3),
            }),
          ),
        ],
      ),
    ],
  );

  FileUtils.writeLibraryToFile(
    library,
    'example/generated/renderable_value_example.generated.dart',
  );
}

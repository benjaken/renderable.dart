import 'package:analyzer/dart/element/element.dart' as az;
import 'package:analyzer/dart/element/type.dart' as az;
import 'package:build/build.dart';
import 'package:demo/annotation/mirror.dart';
import 'package:source_gen/source_gen.dart';
import 'package:renderable/renderable.dart';

class DemoGenerator extends GeneratorForAnnotation<Mirror> {
  @override
  generateForAnnotatedElement(az.Element element, ConstantReader annotation, BuildStep buildStep) {
    return LibraryElement(
      imports: [
        ImportElement(
          uri: "dart:core",
        ),
        ImportElement(
          uri: "dart:core",
          prefix: "core",
        ),
        ImportElement(
          uri: "dart:collection",
          prefix: "collection",
          combinators: [
            ShowElementCombinator([
              "ListQueue",
            ]),
            ShowElementCombinator([
              "ListMixin",
              "ListBase",
            ]),
            HideElementCombinator(
              [
                "MapMixin",
                "MapBase",
                "MapView",
              ],
            ),
          ],
        ),
      ],
      exports: [
        ExportElement(
          uri: "dart:core",
        ),
        ExportElement(
          uri: "dart:collection",
          combinators: [
            ShowElementCombinator([
              "ListQueue",
            ]),
            ShowElementCombinator([
              "ListMixin",
              "ListBase",
            ]),
            HideElementCombinator(
              [
                "MapMixin",
                "MapBase",
                "MapView",
              ],
            ),
          ],
        ),
      ],
      topLevelElements: [
        ClassElement(
          name: "Animal",
          supertype: InterfaceType(
            name: "Object",
          ),
          isAbstract: true,
          fields: [
            FieldElement.setter(
              name: "setter1",
              statements: [
                RawStatement("print(1);"),
              ],
            ),
            FieldElement.getter(
              name: "getter1",
              statements: [
                ReturnStatement(IntValue(1234)),
              ],
            ),
            FieldElement.accessor(name: "accessor1"),
            FieldElement(name: "field1"),
            FieldElement(
              name: "field2",
              type: DartType.int,
              value: IntValue(1234),
            ),
            FieldElement(
              name: "field3",
              type: DartType.double,
              isStatic: true,
              value: DoubleValue(123.4),
            ),
          ],
          methods: [
            MethodElement(
              name: "method1",
              statements: [
                ReturnStatement(StringValue("method2!")),
              ],
            ),
            MethodElement(
              name: "method2",
              isAbstract: true,
              returnType: DartType.string,
              parameters: [
                ParameterElement.required(
                  name: "param1",
                  type: DartType.int,
                ),
                ParameterElement.optional(
                  name: "param2",
                  type: DartType.double,
                ),
              ],
            ),
            MethodElement(
              name: "method3",
              isStatic: true,
              isAsynchronous: true,
              isGenerator: true,
              returnType: InterfaceType(
                name: "Stream",
                typeParameters: [
                  TypeParameterElement(
                    name: "String",
                  ),
                ],
              ),
              parameters: [
                ParameterElement.required(
                  name: "param1",
                  type: DartType.int,
                ),
                ParameterElement.required(
                  name: "param2",
                  type: DartType.double,
                ),
                ParameterElement.named(
                  name: "param3",
                  type: DartType.double,
                  defaultValue: DoubleValue(123.4),
                ),
                ParameterElement.named(
                  name: "param4",
                  type: DartType.int,
                  defaultValue: IntValue(1234),
                ),
              ],
            ),
          ],
        ),
      ],
    ).render();
  }
}

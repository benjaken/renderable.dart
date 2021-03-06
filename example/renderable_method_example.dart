import 'package:renderable/renderable.dart';
import 'package:renderable/src/statement/addition_statement.dart';
import 'package:renderable/src/statement/variable_declaration_statement.dart';
import 'package:renderable/src/type/dart_type.dart';

void main() {
  var library = LibraryElement(
    topLevelElements: [
      ClassElement(
        name: 'RenderableMethodExample',
        methods: [
          MethodElement(
            name: 'defaultMethod',
          ),
          MethodElement(
            name: 'basicMethod',
            returnType: InterfaceType(name: 'int'),
            statements: [
              VariableDeclarationStatement(
                name: 'a',
                type: DartType(name: 'int'),
                value: IntValue(100),
              ),
              VariableDeclarationStatement(
                name: 'b',
                type: DartType(name: 'int'),
                value: IntValue(33),
              ),
              VariableDeclarationStatement(
                name: 'c',
                type: DartType(name: 'int'),
                value: AdditionStatement(
                  values: [
                    Variable(name: 'a'),
                    Variable(name: 'b'),
                  ],
                ),
              ),
              ReturnStatement(Variable(name: 'c')),
            ],
          ),
          MethodElement(
            isStatic: true,
            name: 'staticMethod',
            returnType: InterfaceType(name: 'String'),
          ),
          MethodElement(
            isStatic: true,
            isAsynchronous: true,
            name: 'staticAsyncMethod',
            returnType: InterfaceType(
              name: 'Future',
              typeArguments: [
                InterfaceType(name: 'String'),
              ],
            ),
          ),
          MethodElement(
            isGenerator: true,
            name: 'syncGeneratorMethod',
            returnType: InterfaceType(
              name: 'Iterable',
              typeArguments: [
                InterfaceType(name: 'String'),
              ],
            ),
          ),
          MethodElement(
            isAsynchronous: true,
            isGenerator: true,
            name: 'asyncGeneratorMethod',
            returnType: InterfaceType(
              name: 'Stream',
              typeArguments: [
                InterfaceType(name: 'String'),
              ],
            ),
          ),
          MethodElement(
            name: 'returnGenericValueMethod',
            returnType: InterfaceType(
              name: 'Stream',
              typeArguments: [
                InterfaceType(
                  name: 'List',
                  typeArguments: [
                    DartType(
                      name: 'int',
                    ),
                  ],
                ),
              ],
            ),
          ),
          MethodElement(
            name: 'genericMethod',
            returnType: DartType(name: 'void'),
            typeParameters: [
              TypeParameterElement(name: 'T'),
              TypeParameterElement(
                name: 'R',
                bound: DartType(
                  name: 'List',
                ),
              ),
            ],
          ),
          MethodElement(
            name: 'parametersMethod',
            returnType: DartType(name: 'void'),
            parameters: [
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'a',
                isRequired: true,
              ),
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'b',
                isRequired: true,
              ),
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'c',
                isNamed: true,
              ),
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'd',
                isNamed: true,
              ),
            ],
          ),
          MethodElement(
            name: 'parametersMethod2',
            returnType: DartType(name: 'void'),
            parameters: [
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'a',
                isRequired: true,
              ),
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'b',
                isRequired: true,
              ),
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'c',
                isOptionalPositional: true,
              ),
              ParameterElement(
                type: DartType(name: 'int'),
                name: 'd',
                isOptionalPositional: true,
              ),
            ],
          ),
          MethodElement(
            name: 'genericParameterMethod',
            returnType: DartType(name: 'void'),
            parameters: [
              ParameterElement(
                type: InterfaceType(
                  name: 'List',
                  typeArguments: [
                    DartType(name: 'int'),
                  ],
                ),
                name: 'a',
                isOptionalPositional: true,
              ),
            ],
          ),
          MethodElement(
            name: 'functionParameterMethod',
            returnType: DartType(name: 'void'),
            parameters: [
              ParameterElement(
                type: InterfaceType(
                  name: 'List',
                  typeArguments: [
                    DartType(name: 'int'),
                  ],
                ),
                name: 'a',
                isRequired: true,
                parameters: [
                  ParameterElement(
                    name: 'd',
                    type: DartType(name: 'double'),
                    isRequired: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  FileUtils.writeLibraryToFile(
    library,
    'example/generated/renderable_method_example.generated.dart',
  );
}

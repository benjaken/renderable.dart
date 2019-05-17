import 'package:code_gen/code_gen.dart';
import 'package:code_gen/src/statement/addition_statement.dart';
import 'package:code_gen/src/statement/declaration_statement.dart';
import 'package:code_gen/src/type/dart_type.dart';

void main() {
  FileElement(
    filePath: 'example/generated/code_gen_method_example.generated.dart',
    renders: [
      ClassElement(
        name: 'CodeGenMethodExample',
        methods: [
          MethodElement(
            name: 'defaultMethod',
          ),
          MethodElement(
            name: 'basicMethod',
            returnType: InterfaceType(name: 'int'),
            body: FunctionBody(
              statements: [
                DeclarationStatement(
                  name: 'a',
                  type: DartType(name: 'int'),
                  value: IntValue(value: 100),
                ),
                DeclarationStatement(
                  name: 'b',
                  type: DartType(name: 'int'),
                  value: IntValue(value: 33),
                ),
                DeclarationStatement(
                  name: 'c',
                  type: DartType(name: 'int'),
                  value: AdditionStatement(
                    values: [
                      Variable(name: 'a'),
                      Variable(name: 'b'),
                    ],
                  ),
                ),
                ReturnStatement(
                  returnValue: Variable(name: 'c'),
                ),
              ],
            ),
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
        ],
      ),
    ],
  ).writeToFile();
}
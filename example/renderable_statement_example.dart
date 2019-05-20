import 'package:renderable/renderable.dart';
import 'package:renderable/src/statement/addition_statement.dart';
import 'package:renderable/src/statement/division_statement.dart';
import 'package:renderable/src/statement/modulo_statement.dart';
import 'package:renderable/src/statement/multiplication_statement.dart';
import 'package:renderable/src/statement/subtraction_statement.dart';

void main() {
  FileElement(
    filePath: 'example/generated/renderable_statement_example.generated.dart',
    renders: [
      ClassElement(
        name: 'RenderableValue',
        methods: [
          MethodElement(
            name: 'statement',
            returnType: DartType.void_,
            body: FunctionBody(
              statements: [
                RawStatement('/// Raw statement'),
                VariableDeclarationStatement(
                  name: 'tmp',
                  type: DartType.dynamic,
                  value: IntValue(0),
                ),
                AssignmentStatement(
                  name: 'tmp',
                  value: IntValue(1),
                ),
                CompoundAssignmentStatement(
                  name: 'tmp',
                  operator: CompoundAssignmentOperator.IfNull,
                  value: IntValue(2),
                ),
                AssignmentStatement(
                  name: 'tmp',
                  value: AdditionStatement(
                    values: [
                      IntValue(1),
                      IntValue(2),
                      IntValue(3),
                    ],
                  ),
                ),
                AssignmentStatement(
                  name: 'tmp',
                  value: SubtractionStatement(
                    values: [
                      IntValue(1),
                      IntValue(2),
                      IntValue(3),
                    ],
                  ),
                ),
                AssignmentStatement(
                  name: 'tmp',
                  value: MultiplicationStatement(
                    values: [
                      IntValue(1),
                      IntValue(2),
                      IntValue(3),
                    ],
                  ),
                ),
                AssignmentStatement(
                  name: 'tmp',
                  value: DivisionStatement(
                    values: [
                      IntValue(1),
                      IntValue(2),
                      IntValue(3),
                    ],
                  ),
                ),
                AssignmentStatement(
                  name: 'tmp',
                  value: ModuloStatement(
                    values: [
                      IntValue(1),
                      IntValue(2),
                      IntValue(3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ).writeToFile();
}

import 'package:renderable/renderable.dart';

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
              ],
            ),
          ),
        ],
      ),
    ],
  ).writeToFile();
}

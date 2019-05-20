import 'package:renderable/renderable.dart';

void main() {
  FileElement(
    filePath: 'example/generated/renderable_function_example.generated.dart',
    renders: [
      FunctionElement(
        name: 'main',
        returnType: DartType.void_,
        body: FunctionBody(
          statements: [
            VariableDeclarationStatement(
              name: 'tmp',
              type: DartType.int,
            ),
          ],
        ),
      ),
    ],
  ).writeToFile();
}

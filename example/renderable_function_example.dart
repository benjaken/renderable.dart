import 'package:renderable/renderable.dart';

void main() {
  var library = LibraryElement(
    topLevelElements: [
      FunctionElement(
        name: 'main',
        returnType: DartType.void_,
        statements: [
          VariableDeclarationStatement(
            name: 'tmp',
            type: DartType.int,
          ),
        ],
      ),
      FunctionElement(
        name: 'main2',
        returnType: DartType.void_,
        parameters: [
          ParameterElement(
            name: 'a',
            type: DartType.int,
            isNamed: true,
          ),
          ParameterElement(
            name: 'b',
            type: DartType.double,
            isRequired: true,
          ),
        ],
        statements: [
          VariableDeclarationStatement(
            name: 'tmp',
            type: DartType.int,
          ),
        ],
      ),
      FunctionElement(
        name: 'main3',
        returnType: DartType.dynamic,
        isAsynchronous: true,
        isGenerator: true,
        statements: [
          VariableDeclarationStatement(
            name: 'tmp',
            type: DartType.int,
          ),
        ],
      ),
      FunctionElement(
        name: 'main4',
        returnType: DartType.dynamic,
        isAsynchronous: false,
        isGenerator: true,
        statements: [
          VariableDeclarationStatement(
            name: 'tmp',
            type: DartType.int,
          ),
        ],
      ),
      FunctionElement(
        name: 'main5',
        returnType: DartType.dynamic,
        isAsynchronous: true,
        statements: [
          VariableDeclarationStatement(
            name: 'tmp',
            type: DartType.int,
          ),
        ],
      ),
    ],
  );

  FileUtils.writeLibraryToFile(
    library,
    'example/generated/renderable_function_example.generated.dart',
  );
}

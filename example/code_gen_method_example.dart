import 'package:code_gen/code_gen.dart';

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
                ReturnStatement(
                  returnValue: IntValue(value: 133),
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

import 'package:code_gen/code_gen.dart';

void main() {
  FileRenderElement(
    filePath: 'example/generated/code_gen_method_example.generated.dart',
    renders: [
      ClassRenderElement(
        name: 'CodeGenMethodExample',
        methods: [
          MethodRenderElement(
            name: 'defaultMethod',
          ),
          MethodRenderElement(
            name: 'basicMethod',
            returnType: InterfaceRenderType(name: 'int'),
          ),
          MethodRenderElement(
            isStatic: true,
            name: 'staticMethod',
            returnType: InterfaceRenderType(name: 'String'),
          ),
          MethodRenderElement(
            isStatic: true,
            isAsynchronous: true,
            name: 'staticAsyncMethod',
            returnType: InterfaceRenderType(
              name: 'Future',
              typeArguments: [
                InterfaceRenderType(name: 'String'),
              ],
            ),
          ),
          MethodRenderElement(
            isGenerator: true,
            name: 'syncGeneratorMethod',
            returnType: InterfaceRenderType(
              name: 'Iterable',
              typeArguments: [
                InterfaceRenderType(name: 'String'),
              ],
            ),
          ),
          MethodRenderElement(
            isAsynchronous: true,
            isGenerator: true,
            name: 'asyncGeneratorMethod',
            returnType: InterfaceRenderType(
              name: 'Stream',
              typeArguments: [
                InterfaceRenderType(name: 'String'),
              ],
            ),
          ),
        ],
      ),
    ],
  ).writeToFile();
}

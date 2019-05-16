import 'package:code_gen/code_gen.dart';

void main() {
  FileRenderElement(
    filePath: 'example/generated/code_gen_import_example.generated.dart',
    imports: [
      ImportRenderElement(path: '../misc/some_file.dart'),
      ImportRenderElement(path: '../misc/some_file.dart', prefix: 'sf'),
      ImportRenderElement(path: '../misc/some_file.dart', shows: ['SomeFile']),
      ImportRenderElement(path: '../misc/some_file.dart', hides: ['SomeFile']),
      ImportRenderElement(path: '../misc/some_file.dart', shows: ['SomeFile'], hides: ['SomeFile']),
      ImportRenderElement(
        path: '../misc/some_file.dart',
        shows: ['SomeFile', 'SomeFile2'],
        hides: ['SomeFile2', 'SomeFile3'],
        prefix: 'sf2',
        isDeferred: true,
      ),
    ],
  ).writeToFile();
}

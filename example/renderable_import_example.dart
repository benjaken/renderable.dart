import 'package:renderable/renderable.dart';

void main() {
  FileElement(
    filePath: 'example/generated/renderable_import_example.generated.dart',
    imports: [
      ImportElement(path: '../misc/some_file.dart'),
      ImportElement(path: '../misc/some_file.dart', prefix: 'sf'),
      ImportElement(path: '../misc/some_file.dart', shows: ['SomeFile']),
      ImportElement(path: '../misc/some_file.dart', hides: ['SomeFile']),
      ImportElement(path: '../misc/some_file.dart', shows: ['SomeFile'], hides: ['SomeFile']),
      ImportElement(
        path: '../misc/some_file.dart',
        shows: ['SomeFile', 'SomeFile2'],
        hides: ['SomeFile2', 'SomeFile3'],
        prefix: 'sf2',
        isDeferred: true,
      ),
    ],
  ).writeToFile();
}

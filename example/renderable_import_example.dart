import 'package:renderable/renderable.dart';

void main() {
  var library = LibraryElement(
    imports: [
      ImportElement(uri: '../misc/some_file.dart'),
      ImportElement(uri: '../misc/some_file.dart', prefix: 'sf'),
      ImportElement.simple(uri: '../misc/some_file.dart', shows: ['SomeFile']),
      ImportElement.simple(uri: '../misc/some_file.dart', hides: ['SomeFile']),
      ImportElement.simple(uri: '../misc/some_file.dart', shows: ['SomeFile'], hides: ['SomeFile']),
      ImportElement.simple(
        uri: '../misc/some_file.dart',
        shows: ['SomeFile', 'SomeFile2'],
        hides: ['SomeFile2', 'SomeFile3'],
        prefix: 'sf2',
        isDeferred: true,
      ),
    ],
  );

  FileUtils.writeLibraryToFile(
    library,
    'example/generated/renderable_import_example.generated.dart',
  );
}

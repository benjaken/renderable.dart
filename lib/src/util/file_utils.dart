import 'dart:io';

import 'package:renderable/src/element/library_element.dart';

abstract class FileUtils {
  static void writeLibraryToFile(LibraryElement libraryElement, String path) {
    File(path).writeAsStringSync(libraryElement.render());
  }
}

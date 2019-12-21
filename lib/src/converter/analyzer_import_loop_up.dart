//import 'package:analyzer/dart/element/element.dart' as az;
//import 'package:analyzer/dart/element/type.dart' as az;
//
//class AnalyzerImportLoopUp {
//  /// Map<LibId, Map<LibId, Prefix>>
//  static Map<int, Map<int, String>> loopUpDict = {};
//
//  static void parse(az.ClassElement element) {
//    int libId = element.library.id;
//
//    /// init lib
//    loopUpDict[libId] = {};
//
//    element.library.imports.forEach((import) {
//      String prefix = import.prefix?.name;
//
//      if (prefix != null) {
//        loopUpDict[libId][import.importedLibrary.id] = prefix;
//
//        import.importedLibrary.exportedLibraries.forEach((export) {
//          loopUpDict[libId][export.id] = prefix;
//        });
//      }
//    });
//  }
//
//  static String getPrefix(int elementLibraryId, int libraryId) {
//    return loopUpDict[elementLibraryId][libraryId];
//  }
//
////  static List<int> parseLibraryIdList(List<az.LibraryElement> libraries) {
////    if (libraries.isEmpty) return [];
////
////    return libraries
////        .fold(<int>[], (prev, e) => prev..addAll(parseLibraryIdList(e.exportedLibraries)));
////  }
//}

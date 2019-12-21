import 'package:renderable/src/element/element.dart';

abstract class ElementUtils {
  static Element changeName(Element element, String name) {
    if (element == null) {
      return null;
    }
    return element..name = name;
  }

  static Element changeSynthetic(Element element, isSynthetic) {
    if (element == null) {
      return null;
    }
    return element..isSynthetic = isSynthetic;
  }
}

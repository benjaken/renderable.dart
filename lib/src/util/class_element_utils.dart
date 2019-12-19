import 'package:renderable/src/element/class_element.dart';

abstract class ClassElementUtils {
  static ClassElement toAbstract(ClassElement classElement) {
    return _changeAbstract(classElement, true);
  }

  static ClassElement toConcrete(ClassElement classElement) {
    return _changeAbstract(classElement, true);
  }

  static ClassElement _changeAbstract(ClassElement classElement, bool isAbstract) {
    // todo: recursive
    return classElement..isAbstract = isAbstract;
  }

  static ClassElement toPrivate(ClassElement classElement) {
    if (!classElement.name.startsWith("_")) {
      return classElement;
    }
    return classElement..name = "_${classElement.name}";
  }

  static ClassElement toPublic(ClassElement classElement) {}
}

import 'package:renderable/renderable.dart';
import 'package:renderable/src/type/interface_type.dart';

class TemplateUtil {
  static InterfaceType wrapTypeArguments(
    InterfaceType origin,
    InterfaceType wrapper,
  ) {
    return wrapper..typeArguments = [origin];
  }

  static InterfaceType wrapFutureIf(InterfaceType origin, bool condition) {
    if (!condition) return origin;
    return wrapTypeArguments(origin, InterfaceType(name: 'Future'));
  }

  static String generateModifiers({
    bool isAbstract = false,
    bool isStatic = false,
    bool isFinal = false,
    bool isConst = false,
  }) {
    assert(!isFinal || !isConst, 'Members can\'t be declared to be both final and const');
    assert((isConst && isStatic) || (!isConst), 'Only static fields can be declared as const');

    List<String> modifiers = [];

    if (isAbstract) modifiers.add('abstract');
    if (isStatic) modifiers.add('static');
    if (isFinal) modifiers.add('final');
    if (isConst) modifiers.add('const');

    return modifiers.join(' ');
  }

  static String generateFunctionModifiers({
    bool isAsynchronous = false,
    bool isGenerator = false,
  }) {
    List<String> modifiers = [];

    if (isGenerator && isAsynchronous) {
      modifiers.add('async*');
    } else if (isGenerator && !isAsynchronous) {
      modifiers.add('sync*');
    } else if (isAsynchronous) {
      modifiers.add('async');
    }
    ;

    return modifiers.join(' ');
  }
}

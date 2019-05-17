import 'package:code_gen/code_gen.dart';

class TemplateUtil {
  static InterfaceRenderType wrapTypeArguments(
    InterfaceRenderType origin,
    InterfaceRenderType wrapper,
  ) {
    return wrapper..typeArguments = [origin];
  }

  static InterfaceRenderType wrapFutureIf(InterfaceRenderType origin, bool condition) {
    if (!condition) return origin;
    return wrapTypeArguments(origin, InterfaceRenderType(name: 'Future'));
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

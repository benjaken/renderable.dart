import 'package:renderable/renderable.dart';
import 'package:renderable/src/element/namespace_combinator.dart';
import 'package:renderable/src/type/interface_type.dart';

class TemplateUtils {
  static String stringFromList(
    List list, {
    String delimiter = "\n",
    String suffix = "",
  }) {
    return list.where((item) => item != null).where((item) => item != "").map((item) {
          if (item is List) {
            return stringFromList(item, delimiter: delimiter);
          }
          return item;
        }).join(delimiter) +
        suffix;
  }

  static String stringFromCombinators(List<NamespaceCombinator> combinators) {
    if (combinators.isEmpty) {
      return "";
    }
    List<String> shows = [];
    List<String> hides = [];
    combinators.whereType<ShowElementCombinator>().forEach((c) => shows.addAll(c.shownNames));
    combinators.whereType<HideElementCombinator>().forEach((c) => hides.addAll(c.hiddenNames));
    return stringFromList([
      if (shows.isNotEmpty) "show ${stringFromList(shows, delimiter: ", ")}",
      if (hides.isNotEmpty) "hide ${stringFromList(hides, delimiter: ", ")}",
    ], delimiter: " ");
  }

  static String stringFromTypeParameters(List<TypeParameterElement> typeParameters) {
    if (typeParameters == null || typeParameters.isEmpty) {
      return "";
    }
    return '<${typeParameters.join(', ')}>';
  }

  static String stringFromParameters(List<ParameterElement> parameters) {
    if (parameters == null || parameters.isEmpty) {
      return "";
    }
    List<ParameterElement> requiredParameters = parameters.where((e) => e.isRequired).toList();
    List<ParameterElement> namedParameters = parameters.where((e) => e.isNamed).toList();
    List<ParameterElement> optionalPositionalParameters =
        parameters.where((e) => e.isOptionalPositional).toList();

    List<String> templateList = [];

    if (requiredParameters.isNotEmpty) {
      templateList.add(requiredParameters.join(', '));
    }

    if (optionalPositionalParameters.isNotEmpty) {
      templateList.add('[${optionalPositionalParameters.join(', ')}]');
    }

    if (namedParameters.isNotEmpty) {
      templateList.add('{${namedParameters.join(', ')}}');
    }

    return templateList.join(', ');
  }

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

  static String stringFromModifiers({
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

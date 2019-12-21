import 'package:renderable/renderable.dart';
import 'package:renderable/src/annotation/internal/renderable_only.dart';
import 'package:renderable/src/element/function_typed_element.dart';

abstract class ExecutableElement implements FunctionTypedElement {
  /// true if this executable element is abstract. Executable elements are abstract if they are not external and have no body.
  bool isAbstract;

  /// true if this executable element has body marked as being asynchronous.
  bool isAsynchronous;

  /// true if this executable element is external. Executable elements are external if they are explicitly marked as such using the 'external' keyword.
  bool isExternal;

  /// [true] if this executable element has a body marked as being a generator.
  bool isGenerator;

  /// [true] if this element is a static element. A static element is an element that is not associated with a particular instance, but rather with an entire library or class.
  bool isStatic;

  @renderableOnly
  List<Statement> statements;
}

import 'package:renderable/src/element/element.dart';

abstract class ClassMemberElement implements Element {
  bool isStatic;

  @override
  String name;

  @override
  bool isSynthetic;
}

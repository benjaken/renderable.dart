import 'package:renderable/renderable.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:meta/meta.dart';

class TypeParameterElement extends Renderable implements Element {
  @override
  String name;

  DartType bound;

  @override
  bool isSynthetic;

  TypeParameterElement({
    @required this.name,
    this.bound,
  });

  @override
  String render() {
    return bound == null ? name : '$name extends $bound';
  }
}

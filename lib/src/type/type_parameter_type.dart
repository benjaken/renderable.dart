import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:renderable/src/util/template_utils.dart';

class TypeParameterType extends Renderable implements DartType {
  DartType bound;

  @override
  String name;

  @override
  String prefix;

  TypeParameterType({
    @required this.name,
    this.bound,
  });

  @override
  String render() {
//    if (bound != null) {
//      return '$name extends $bound';
//    }
    return TemplateUtils.stringFromList([
      if (this.prefix != null) "${this.prefix}.",
      this.name,
    ], delimiter: " ");
  }
}

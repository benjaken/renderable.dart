import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/type/dart_type.dart';
import 'package:meta/meta.dart';

class TypeParameterType extends Renderable implements DartType {
  DartType bound;

  @override
  String name;

  TypeParameterType({
    @required this.name,
    this.bound,
  });

  @override
  String render() {
    if (bound != null) {
      return '$name extends $bound';
    }
    return name;
  }
}

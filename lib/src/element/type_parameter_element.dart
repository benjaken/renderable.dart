import 'package:code_gen/code_gen.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/element.dart';
import 'package:code_gen/src/type/interface_type.dart';
import 'package:meta/meta.dart';

class TypeParameterElement extends Renderable implements Element {
  @override
  String name;

  InterfaceType bound;

  TypeParameterElement({
    @required this.name,
  });

  @override
  String render() {
    return name;
  }
}

import 'package:code_gen/src/contract/renderable.dart';

class InterfaceRenderType extends Renderable {
  String name;
  String prefix;

  InterfaceRenderType({
    this.name,
    this.prefix,
  });

  @override
  String render() {
    return prefix == null ? (name ?? '') : '$prefix.$name';
  }
}

import 'package:code_gen/src/contract/renderable.dart';
import 'package:meta/meta.dart';

class Variable extends Renderable {
  String name;

  Variable({
    @required this.name,
  });

  @override
  String render() {
    return name;
  }
}

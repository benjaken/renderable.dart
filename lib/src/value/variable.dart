import 'package:meta/meta.dart';
import 'package:renderable/src/contract/value.dart';

@deprecated
class Variable extends Value {
  String name;

  Variable({
    @required this.name,
  });

  @override
  String render() {
    return name;
  }
}

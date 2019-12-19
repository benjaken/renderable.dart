import 'package:meta/meta.dart';
import 'package:renderable/src/contract/value.dart';

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

import 'package:code_gen/src/contract/value.dart';
import 'package:meta/meta.dart';

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

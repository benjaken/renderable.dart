import 'package:renderable/src/contract/value.dart';
import 'package:meta/meta.dart';

class IntValue extends Value {
  int value;

  IntValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

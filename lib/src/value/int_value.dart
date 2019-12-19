import 'package:renderable/src/contract/value.dart';

class IntValue extends Value {
  int value;

  IntValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

import 'package:renderable/src/contract/value.dart';

class NumValue extends Value {
  num value;

  NumValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

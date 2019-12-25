import 'package:renderable/src/contract/value.dart';

@deprecated
class NumValue extends Value {
  num value;

  NumValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

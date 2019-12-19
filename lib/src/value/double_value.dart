import 'package:renderable/src/contract/value.dart';

class DoubleValue extends Value {
  double value;

  DoubleValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

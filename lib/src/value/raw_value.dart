import 'package:renderable/src/contract/value.dart';

@deprecated
class RawValue extends Value {
  String value;

  RawValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

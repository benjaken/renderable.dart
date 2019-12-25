import 'package:renderable/src/contract/value.dart';

@deprecated
class BoolValue extends Value {
  bool value;

  BoolValue(this.value);

  @override
  String render() {
    return value.toString();
  }

  static final BoolValue False = BoolValue(false);
  static final BoolValue True = BoolValue(true);
}

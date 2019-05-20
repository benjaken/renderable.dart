import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

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

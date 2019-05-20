import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class RawValue extends Value {
  String value;

  RawValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

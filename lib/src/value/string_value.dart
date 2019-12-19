import 'package:renderable/src/contract/value.dart';

class StringValue extends Value {
  String value;

  StringValue(this.value);

  @override
  String render() {
    return '\'$value\'';
  }
}

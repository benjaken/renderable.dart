import 'package:renderable/src/contract/value.dart';

@deprecated
class NullValue extends Value {
  @override
  String render() {
    return 'null';
  }
}

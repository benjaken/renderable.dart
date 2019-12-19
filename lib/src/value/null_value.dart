import 'package:renderable/src/contract/value.dart';

class NullValue extends Value {
  @override
  String render() {
    return 'null';
  }
}

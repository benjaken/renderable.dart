import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class NullValue extends Renderable implements Value {
  @override
  String render() {
    return 'null';
  }
}

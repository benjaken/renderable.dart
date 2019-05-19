import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class RawValue extends Renderable implements Value {
  Object value;

  RawValue({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }
}

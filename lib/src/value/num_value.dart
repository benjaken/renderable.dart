import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class NumValue extends Renderable implements Value {
  num value;

  NumValue({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }
}

import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class DoubleValue extends Renderable implements Value {
  double value;

  DoubleValue({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }
}

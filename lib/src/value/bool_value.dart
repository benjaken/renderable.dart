import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class BoolValue extends Renderable implements Value {
  bool value;

  BoolValue({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }

  static final bool False = false;
  static final bool True = true;
}

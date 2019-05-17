import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/value_renderable.dart';
import 'package:meta/meta.dart';

class IntValue extends ValueRenderable {
  int value;

  IntValue({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }
}

import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/variable_renderable.dart';
import 'package:meta/meta.dart';

class IntVariable extends VariableRenderable {
  int value;

  IntVariable({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }
}

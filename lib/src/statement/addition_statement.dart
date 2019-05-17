import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/value.dart';
import 'package:meta/meta.dart';

class AdditionStatement extends Renderable {
  List<Value> values;

  AdditionStatement({
    @required this.values,
  });

  @override
  String render() {
    return values.join(' + ');
  }
}

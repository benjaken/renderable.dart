import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';
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

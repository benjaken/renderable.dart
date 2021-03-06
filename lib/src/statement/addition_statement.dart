import 'package:meta/meta.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/contract/value.dart';

class AdditionStatement extends Statement {
  List<Value> values;

  AdditionStatement({
    @required this.values,
  });

  @override
  String render() {
    return values.join(' + ');
  }
}

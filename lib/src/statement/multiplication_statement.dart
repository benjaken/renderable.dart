import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/contract/value.dart';

class MultiplicationStatement extends Statement {
  List<Value> values;

  MultiplicationStatement({
    @required this.values,
  });

  @override
  String render() {
    return values.join(' * ');
  }
}

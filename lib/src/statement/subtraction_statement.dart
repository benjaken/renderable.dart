import 'package:meta/meta.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/contract/value.dart';

class SubtractionStatement extends Statement {
  List<Value> values;

  SubtractionStatement({
    @required this.values,
  });

  @override
  String render() {
    return values.join(' - ');
  }
}

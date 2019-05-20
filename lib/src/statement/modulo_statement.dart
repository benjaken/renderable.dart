import 'package:meta/meta.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/contract/value.dart';

class ModuloStatement extends Statement {
  List<Value> values;

  ModuloStatement({
    @required this.values,
  });

  @override
  String render() {
    return values.join(' % ');
  }
}

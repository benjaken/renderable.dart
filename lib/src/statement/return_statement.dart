import 'package:code_gen/src/contract/statement.dart';
import 'package:code_gen/src/contract/value_renderable.dart';
import 'package:meta/meta.dart';

class ReturnStatement extends Statement {
  ValueRenderable returnValue;

  ReturnStatement({
    @required this.returnValue,
  });

  @override
  String render() {
    return 'return $returnValue;';
  }
}

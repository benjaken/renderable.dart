import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';

class ReturnStatement extends Statement {
  Renderable returnValue;

  ReturnStatement(this.returnValue);

  @override
  String render() {
    return 'return $returnValue;';
  }
}

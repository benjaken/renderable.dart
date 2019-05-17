import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/contract/statement.dart';
import 'package:code_gen/src/contract/value.dart';
import 'package:meta/meta.dart';

class ReturnStatement extends Statement {
  Renderable returnValue;

  ReturnStatement({
    @required this.returnValue,
  });

  @override
  String render() {
    return 'return $returnValue;';
  }
}

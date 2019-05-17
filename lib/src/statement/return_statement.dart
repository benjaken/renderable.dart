import 'package:code_gen/src/contract/statement_renderable.dart';
import 'package:code_gen/src/contract/variable_renderable.dart';
import 'package:meta/meta.dart';

class ReturnStatement extends StatementRenderable {
  VariableRenderable returnValue;

  ReturnStatement({
    @required this.returnValue,
  });

  @override
  String render() {
    return 'return $returnValue;';
  }
}

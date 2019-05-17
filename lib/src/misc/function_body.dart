import 'package:code_gen/src/contract/statement_renderable.dart';
import 'package:code_gen/src/contract/renderable.dart';
import 'package:meta/meta.dart';

class FunctionBody extends Renderable {
  List<StatementRenderable> statements;

  FunctionBody({
    @required this.statements,
  });

  @override
  String render() {
    return statements.join('\n');
  }
}

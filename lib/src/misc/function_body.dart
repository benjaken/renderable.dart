import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';

class FunctionBody extends Renderable {
  List<Statement> statements;

  FunctionBody({
    this.statements,
  }) {
    statements ??= [];
  }

  @override
  String render() {
    return [
      this.statements.join('\n'),
    ].join('\n');
  }
}

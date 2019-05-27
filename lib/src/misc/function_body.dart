import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:meta/meta.dart';
import 'package:renderable/src/statement/return_statement.dart';

class FunctionBody extends Renderable {
  List<Statement> statements;
  ReturnStatement returnStatement;

  FunctionBody({
    this.statements,
    this.returnStatement,
  }) {
    statements ??= [];
  }

  @override
  String render() {
    return [
      this.statements.join('\n'),
      returnStatement ?? '',
    ].join('\n');
  }
}

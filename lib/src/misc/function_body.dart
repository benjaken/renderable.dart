import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:meta/meta.dart';
import 'package:renderable/src/statement/return_statement.dart';

class FunctionBody extends Renderable {
  List<Statement> beforeStatements;
  List<Statement> afterStatements;
  List<Statement> statements;
  ReturnStatement returnStatement;

  FunctionBody({
    this.statements,
    this.beforeStatements,
    this.afterStatements,
    this.returnStatement,
  }) {
    statements ??= [];
    beforeStatements ??= [];
    afterStatements ??= [];
  }

  @override
  String render() {
    return [
      this.beforeStatements.join('\n'),
      this.statements.join('\n'),
      this.afterStatements.join('\n'),
      returnStatement ?? '',
    ].join('/n');
  }
}

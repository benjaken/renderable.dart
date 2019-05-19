import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:meta/meta.dart';

class FunctionBody extends Renderable {
  List<Statement> statements;

  FunctionBody({
    @required this.statements,
  });

  @override
  String render() {
    return statements.join('\n');
  }
}

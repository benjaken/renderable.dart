import 'package:meta/meta.dart';
import 'package:renderable/src/constant/compound_assignment_operator.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/statement/assignment_statement.dart';

class CompoundAssignmentStatement extends AssignmentStatement {
  CompoundAssignmentOperator operator;

  CompoundAssignmentStatement({
    @required String name,
    @required this.operator,
    Renderable value,
  }) : super(
          name: name,
          value: value,
        );

  @override
  String render() {
    return '$name $operator= $value;';
  }
}

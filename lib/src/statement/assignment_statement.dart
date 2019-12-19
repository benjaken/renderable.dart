import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';

class AssignmentStatement extends Statement {
  String name;

  Renderable value;

  AssignmentStatement({
    @required this.name,
    this.value,
  });

  @override
  String render() {
    return '$name = $value;';
  }
}

import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:renderable/src/element/variable_element.dart';
import 'package:renderable/src/type/dart_type.dart';
import 'package:meta/meta.dart';

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

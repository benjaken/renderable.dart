import 'package:renderable/src/contract/renderable.dart';

class CompoundAssignmentOperator implements Renderable {
  final String operator;

  const CompoundAssignmentOperator._(this.operator);

  @override
  String render() => operator;

  @override
  String get code => render();

  static final CompoundAssignmentOperator Addition = CompoundAssignmentOperator._('+');
  static final CompoundAssignmentOperator Subtraction = CompoundAssignmentOperator._('-');
  static final CompoundAssignmentOperator Multiplication = CompoundAssignmentOperator._('*');
  static final CompoundAssignmentOperator Division = CompoundAssignmentOperator._('/');
  static final CompoundAssignmentOperator FloorDivide = CompoundAssignmentOperator._('~/');
  static final CompoundAssignmentOperator Modulo = CompoundAssignmentOperator._('%');
  static final CompoundAssignmentOperator BitwiseRightShift = CompoundAssignmentOperator._('>>');
  static final CompoundAssignmentOperator BitwiseLeftShift = CompoundAssignmentOperator._('<<');
  static final CompoundAssignmentOperator BitwiseAnd = CompoundAssignmentOperator._('&');
  static final CompoundAssignmentOperator BitwiseOr = CompoundAssignmentOperator._('|');
  static final CompoundAssignmentOperator IfNull = CompoundAssignmentOperator._('??');
}

import 'package:renderable/src/contract/renderable.dart';
import 'package:meta/meta.dart';

class DartType extends Renderable {
  String name;

  DartType({
    @required this.name,
  });

  @override
  String render() {
    return name;
  }

  static final DartType dynamic = DartType(name: 'dynamic');
  static final DartType var_ = DartType(name: 'dynamic');
  static final DartType int = DartType(name: 'int');
  static final DartType double = DartType(name: 'double');
  static final DartType num = DartType(name: 'num');
  static final DartType bool = DartType(name: 'bool');
  static final DartType string = DartType(name: 'String');
  static final DartType object = DartType(name: 'Object');
  static final DartType list = DartType(name: 'List');
  static final DartType map = DartType(name: 'Map');
  static final DartType null_ = DartType(name: 'null');
}

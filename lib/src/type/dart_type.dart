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

  static DartType dynamic = DartType(name: 'dynamic');
  static DartType int = DartType(name: 'int');
  static DartType double = DartType(name: 'double');
  static DartType num = DartType(name: 'num');
  static DartType string = DartType(name: 'String');
  static DartType object = DartType(name: 'Object');
  static DartType list = DartType(name: 'List');
  static DartType map = DartType(name: 'Map');
}

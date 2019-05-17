import 'package:code_gen/src/contract/renderable.dart';
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

//  static DartType dynamic = DartType(name: 'dynamic');
//  static DartType int = DartType(name: 'int');
//  static DartType double = DartType(name: 'double');
//  static DartType num = DartType(name: 'num');
//  static DartType String = DartType(name: 'String');
//  static DartType Object = DartType(name: 'Object');
//  static DartType List = DartType(name: 'List');
//  static DartType Map = DartType(name: 'Map');
}

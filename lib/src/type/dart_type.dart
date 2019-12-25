import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/util/template_utils.dart';

class DartType extends Renderable {
  String name;
  String prefix;

  DartType({
    @required this.name,
    this.prefix,
  });

  @override
  String render() {
    return TemplateUtils.stringFromList([
      if (this.prefix != null) "${this.prefix}.",
      this.name,
    ], delimiter: " ");
  }

  static final DartType void_ = DartType(name: 'void');
  static final DartType dynamic = DartType(name: 'dynamic');
  static final DartType var_ = DartType(name: 'var');
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

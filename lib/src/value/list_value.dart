import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class ListValue extends Renderable implements Value {
  List<Renderable> list;

  ListValue(this.list);

  @override
  String render() {
    return list.toString();
  }

  static final bool False = false;
  static final bool True = true;
}

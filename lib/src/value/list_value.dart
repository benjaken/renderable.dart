import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

@deprecated
class ListValue extends Value {
  List<Renderable> list;

  ListValue(this.list);

  @override
  String render() {
    return list.toString();
  }
}

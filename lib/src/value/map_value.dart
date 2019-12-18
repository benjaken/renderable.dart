import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class MapValue extends Value {
  Map<Renderable, Renderable> value;

  MapValue(this.value);

  @override
  String render() {
    return value.toString();
  }
}

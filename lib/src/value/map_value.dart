import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class MapValue extends Renderable implements Value {
  Map<Renderable, Renderable> value;

  MapValue({
    @required this.value,
  });

  @override
  String render() {
    return value.toString();
  }

  static final bool False = false;
  static final bool True = true;
}

import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/value.dart';

class ListValue<T extends Renderable> extends Renderable implements Value {
  List<T> value;

  ListValue({
    @required this.value,
  });

  @override
  String render() {
    return '[${value.join(', ')}]';
  }

  static final bool False = false;
  static final bool True = true;
}

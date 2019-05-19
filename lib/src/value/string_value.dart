import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';

class StringValue extends Renderable {
  String value;

  StringValue({
    @required this.value,
  });

  @override
  String render() {
    return '\'$value\'';
  }
}

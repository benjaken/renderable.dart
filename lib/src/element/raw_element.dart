import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';

class RawElement extends Renderable {
  String raw;

  RawElement({
    @required this.raw,
  });

  @override
  String render() {
    return raw;
  }
}

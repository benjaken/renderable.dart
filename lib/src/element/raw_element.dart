import 'package:renderable/src/contract/renderable.dart';
import 'package:meta/meta.dart';

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

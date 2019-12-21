import 'package:renderable/src/contract/renderable.dart';

class RawElement extends Renderable {
  String raw;

  RawElement(this.raw);

  @override
  String render() {
    return raw;
  }
}

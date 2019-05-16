import 'package:code_gen/src/contract/renderable.dart';
import 'package:meta/meta.dart';

class RawRenderElement extends Renderable {
  String raw;

  RawRenderElement({
    @required this.raw,
  });

  @override
  String render() {
    return raw;
  }
}

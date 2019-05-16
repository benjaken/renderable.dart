import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/element/render_element.dart';
import 'package:meta/meta.dart';

class TypeParameterRenderElement extends Renderable implements RenderElement {
  @override
  String name;

  TypeParameterRenderElement({
    @required this.name,
  });

  @override
  String render() {
    return name;
  }
}

import 'package:code_gen/src/contract/renderable.dart';
import 'package:code_gen/src/template/import_render_element_template.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class ImportRenderElement extends Renderable {
  String path;
  String prefix;
  bool isDeferred;
  List<String> shows;
  List<String> hides;

  ImportRenderElement({
    @required this.path,
    this.prefix,
    this.isDeferred = false,
    this.hides,
    this.shows,
  }) {
    this.hides ??= [];
    this.shows ??= [];
  }

  @override
  String render() {
    assert(!isDeferred || prefix != null, 'isDeferred can\'t use without prefix');

    return mu.render(
      import_render_element_template,
      {
        'path': path,
        'prefix': prefix,
        'isDeferred': isDeferred,
        'showsString': shows.isNotEmpty ? ' show ${shows.join(', ')}' : '',
        'hidesString': hides.isNotEmpty ? ' hide ${hides.join(', ')}' : '',
      },
    );
  }
}

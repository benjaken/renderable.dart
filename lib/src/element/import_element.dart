import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/template/import_element_template.dart';
import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;

class ImportElement extends Renderable {
  String path;
  String prefix;
  bool isDeferred;
  List<String> shows;
  List<String> hides;

  ImportElement({
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
      import_element_template,
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

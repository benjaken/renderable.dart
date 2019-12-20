import 'package:meta/meta.dart';
import 'package:mustache4dart/mustache4dart.dart' as mu;
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/element/uri_referenced_element.dart';
import 'package:renderable/src/template/import_element_template.dart';

class ImportElement extends Renderable implements UriReferencedElement, Element {
  String prefix;

  bool isDeferred;

  List<String> shows;

  List<String> hides;

  @override
  bool isSynthetic;

  @override
  String name;

  @override
  String uri;

  ImportElement({
    @required this.uri,
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
        'path': uri,
        'prefix': prefix,
        'isDeferred': isDeferred,
        'showsString': shows.isNotEmpty ? ' show ${shows.join(', ')}' : '',
        'hidesString': hides.isNotEmpty ? ' hide ${hides.join(', ')}' : '',
      },
    );
  }
}

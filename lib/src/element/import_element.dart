import 'package:meta/meta.dart';
import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/element/element.dart';
import 'package:renderable/src/element/namespace_combinator.dart';
import 'package:renderable/src/element/uri_referenced_element.dart';
import 'package:renderable/src/util/string_utils.dart';
import 'package:renderable/src/util/template_utils.dart';

class ImportElement extends Renderable implements UriReferencedElement, Element {
  String prefix;

  bool isDeferred;

  List<NamespaceCombinator> combinators;

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
    this.combinators,
  }) {
    combinators ??= [];
  }

  ImportElement.simple({
    @required this.uri,
    this.prefix,
    this.isDeferred = false,
    List<String> shows,
    List<String> hides,
  }) {
    combinators = [
      ShowElementCombinator(shows),
      HideElementCombinator(hides),
    ];
  }

  @override
  String render() {
    assert(!isDeferred || prefix != null, 'isDeferred can\'t use without prefix');

    return TemplateUtils.stringFromList(
      [
        "import",
        StringUtils.quote(this.uri),
        if (isDeferred && prefix != null) "deferred as $prefix",
        if (!isDeferred && prefix != null) "as $prefix",
        TemplateUtils.stringFromCombinators(combinators),
      ],
      delimiter: " ",
      suffix: ";",
    );
  }
}

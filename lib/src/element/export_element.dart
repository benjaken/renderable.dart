import 'package:meta/meta.dart';
import 'package:renderable/renderable.dart';
import 'package:renderable/src/element/namespace_combinator.dart';
import 'package:renderable/src/element/uri_referenced_element.dart';
import 'package:renderable/src/util/string_utils.dart';
import 'package:renderable/src/util/template_utils.dart';

class ExportElement extends Renderable implements UriReferencedElement, Element {
  List<NamespaceCombinator> combinators;

  @override
  bool isSynthetic = null;

  @override
  String name = null;

  @override
  String uri;

  ExportElement({
    @required this.uri,
    this.combinators,
  }) {
    assert(this.uri != null);
    assert(this.uri != "");
    combinators ??= [];
  }

  @override
  String render() {
    return TemplateUtils.stringFromList(
      [
        "export",
        StringUtils.quote(this.uri),
        TemplateUtils.stringFromCombinators(combinators),
      ],
      delimiter: " ",
      suffix: ";",
    );
  }
}

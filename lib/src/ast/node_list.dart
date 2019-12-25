import 'dart:collection';

import 'package:renderable/src/contract/ast_node.dart';

class NodeList<E extends AstNode> with ListMixin<E> {
  List<AstNode> _list;

  @override
  int get length => _list.length;

  set length(int value) => _list.length = value;

  @override
  E operator [](int index) {
    return _list[index];
  }

  @override
  void operator []=(int index, E value) {
    _list[index] = value;
  }
}

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:renderable/renderable.dart';
import 'package:test/test.dart';

var a = '''
void main() {
  int a = 1 + 2;
}
''';

void main() {
  var ast = parseString(content: a).unit;
  print(ast);
//  var nodes = flatten_tree(ast);
//  for (var n in nodes) {
//    print("${n.runtimeType}|$n");
//  }
//  var data = [];
//  for (var k in types.keys) {
//    data.add(k.toString());
//    for (var e in types[k]) {
//      data.add('\t' + e.toString());
//    }
//  }
}

List flatten_tree(AstNode n, [int depth = 9999999]) {
  var que = [];
  que.add(n);
  var nodes = [];
  int nodes_count = que.length;
  int dep = 0;
  int c = 0;
  if (depth == 0) return [n];
  while (que.isNotEmpty) {
    var node = que.removeAt(0);
    if (node is! AstNode) continue;
    for (var cn in node.childEntities) {
      nodes.add(cn);
      que.add(cn);
    }
    //Keeping track of how deep in the tree
    ++c;
    if (c == nodes_count) {
      ++dep; // One layer done
      if (depth <= dep) return nodes;
      c = 0;
      nodes_count = que.length;
    }
  }
  return nodes;
}

show(node) {
  print('Type: ${node.runtimeType}, body: $node');
}

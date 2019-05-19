import 'package:renderable/src/contract/renderable.dart';
import 'package:renderable/src/contract/statement.dart';
import 'package:meta/meta.dart';

class RawStatement extends Statement {
  String raw;

  RawStatement(this.raw);

  @override
  String render() {
    return raw;
  }
}

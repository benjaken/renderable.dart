import 'package:renderable/src/contract/statement.dart';

class RawStatement extends Statement {
  String raw;

  RawStatement(this.raw);

  @override
  String render() {
    return raw;
  }
}

import 'package:renderable/src/contract/literal.dart';
import 'package:renderable/src/contract/renderable.dart';

class BooleanLiteral extends Renderable implements Literal {
  bool value;

  BooleanLiteral(this.value);

  @override
  String render() {
    return value.toString();
  }
}

import 'package:renderable/src/contract/literal.dart';
import 'package:renderable/src/contract/renderable.dart';

class AbstractLiteral<T> extends Renderable implements Literal {
  T value;

  AbstractLiteral(this.value);

  @override
  String render() {
    return value.toString();
  }
}

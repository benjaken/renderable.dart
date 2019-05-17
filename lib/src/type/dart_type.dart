import 'package:code_gen/src/contract/renderable.dart';
import 'package:meta/meta.dart';

class DartType extends Renderable {
  String name;

  DartType({
    @required this.name,
  });

  @override
  String render() {
    return name;
  }
}

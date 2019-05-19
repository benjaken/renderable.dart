import 'package:demo/annotation/mirror.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart' as rx show Observable hide PublishSubject;

@mirror
abstract class Interface1 {}

@mirror
abstract class Interface2 {}

@mirror
class OriginClass<A extends Object, B extends Map> implements Interface1, Interface2 {
  static int intField = 1;
//  final List<int> listIntField = [1];
  Map<List<Future<int>>, int> nestedField = {};
  rx.Observable<int> prefixedField;
  rx.Observable<rx.Observable> nestedPrefixedField;
  rx.Observable<A> field5;

  int get getter1 => 1;

  void method1(int a, int b) {}

  Future<rx.Observable> method2(int a, [int b(String c)]) async {
    return null;
  }

  Iterable<dynamic> method3<C extends Future, D>(int a, {int b(String c)}) sync* {}

  Stream<dynamic> method4(
    int a, {
    @required List<List<int>> b,
    String c = 'dv',
  }) async* {}

  rx.Observable<dynamic> method5<E extends List>({
    @required E b,
    rx.Observable c,
  }) {}
}

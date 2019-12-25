library origin_class;

import 'dart:core';
import 'dart:core' as dart;
import 'package:demo/annotation/mirror.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart' as rx show Observable hide PublishSubject;
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/rxdart.dart';

part 'origin_class.g.dart';

void callback() => null;

@Mirror(
  name: "Interface1",
  callback: callback,
)
abstract class Interface1 {}

@mirror
abstract class Interface2 {}

@Mirror(name: "OriginClass")
class OriginClass<A extends dart.Object, B extends dart.Map> extends dart.Object
    implements Interface1, Interface2 {
  static int intField = 1;
//  final List<int> listIntField = [1];
  Map<List<Future<int>>, int> nestedField = {};
  Stream<int> prefixedField;
  Stream<Stream> nestedPrefixedField;
  Stream<A> field5;

  int get getter1 => null;

  B get getter2 => null;

  set setter1(double val) => null;

  set setter2(A val) => null;

  void method1(int a, int b) {
    var c = 1;
    int d = 2;
    print("hi");
  }

  Future<Stream> method2(int a, [int b(String c)]) async {
    print("hi");
    return null;
  }

  Iterable<dynamic> method3<C extends Future, D>(int a, {int b(String c)}) sync* {}

  Stream<dynamic> method4(
    int a, {
    @required List<List<int>> b,
    String c = 'dv',
  }) async* {}

  Stream<dynamic> method5<E extends List>({
    @required E b,
    Stream c,
  }) {}
}

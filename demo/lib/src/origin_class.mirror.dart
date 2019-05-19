// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MirrorGenerator
// **************************************************************************

import 'package:demo/annotation/mirror.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart' as rx show Observable hide PublishSubject;

abstract class Interface1 extends Object {}

abstract class Interface2 extends Object {}

class OriginClass<A extends Object, B extends Map<dynamic, dynamic>>
    extends Object implements Interface1, Interface2 {
  static int intField;

  Map<List<Future<int>>, int> nestedField;

  rx.Observable<int> prefixedField;

  rx.Observable<rx.Observable<dynamic>> nestedPrefixedField;

  rx.Observable<A> field5;

  int get getter1 {}

  B get getter2 {}

  set setter1(double val) {}

  set setter2(A val) {}

  void method1(int a, int b) {}

  Future<rx.Observable<dynamic>> method2(int a, [int b(String c)]) async {}

  Iterable<dynamic> method3<C extends Future<dynamic>, D>(int a,
      {int b(String c)}) sync* {}

  Stream<dynamic> method4(int a,
      {@required List<List<int>> b, String c = 'dv'}) async* {}

  rx.Observable<dynamic> method5<E extends List<dynamic>>(
      {@required E b, rx.Observable<dynamic> c}) {}
}

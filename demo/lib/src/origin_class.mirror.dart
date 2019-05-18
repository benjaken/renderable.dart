// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MirrorGenerator
// **************************************************************************

import 'package:demo/annotation/mirror.dart';
import 'package:rxdart/rxdart.dart' as rx show Observable hide PublishSubject;

abstract class Interface1 extends Object {}

abstract class Interface2 extends Object {}

class OriginClass extends Object implements Interface1, Interface2 {
  static int intField;

  Map<List<Future<int>>, int> nestedField;

  rx.Observable<int> prefixedField;

  rx.Observable<rx.Observable<dynamic>> nestedPrefixedField;
}

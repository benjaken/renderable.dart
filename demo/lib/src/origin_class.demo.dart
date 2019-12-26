// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DemoGenerator
// **************************************************************************

import "dart:core";
import "dart:core" as core;

export "dart:collection" show ListQueue, ListMixin, ListBase hide MapMixin, MapBase, MapView;
export "dart:core";

abstract class Animal extends Object {
  var field1;
  int field2 = 1234;
  static double field3 = 123.4;
  dynamic method1() {
    return 'method2!';
  }

  String method2(int param1, [double param2]);
  static Stream<String> method3(int param1, double param2,
      {double param3 = 123.4, int param4 = 1234}) async* {}
  set setter1(dynamic _setter1) {
    print(1);
  }

  get getter1 {
    return 1234;
  }
}

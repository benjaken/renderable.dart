import 'package:demo/annotation/mirror.dart';
import 'package:rxdart/rxdart.dart' as rx show Observable hide PublishSubject;

@mirror
abstract class Interface1 {}

@mirror
abstract class Interface2 {}

@mirror
class OriginClass implements Interface1, Interface2 {
//  static int intField = 1;
//  final List<int> listIntField = [1];
  Map<List<Future<int>>, int> nestedField = {};
//  rx.Observable<int> prefixedField;
//  rx.Observable<rx.Observable> nestedPrefixedField;
}

import 'package:demo/annotation/mirror.dart';

@mirror
class OriginClass {
  int intField = 1;
  List<int> listIntField = [1];
  Map<List<Future<int>>, int> nestedField = {};
}

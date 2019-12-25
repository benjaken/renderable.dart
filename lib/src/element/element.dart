import 'package:renderable/renderable.dart';

abstract class Element implements Renderable {
  String name;

  bool isSynthetic;

//  List<ElementAnnotation> metadata;

//  String documentationComment;
}

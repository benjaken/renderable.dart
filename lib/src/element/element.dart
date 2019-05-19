class Element {
  /// Name of this element, or null if this element does not have a name.
  String name;

  /// `true` represents this element is synthetic. A synthetic element is an
  /// element that is not represented in the source code explicitly, but is
  /// implied by the source code, such as the default constructor for a class
  /// that does not explicitly define any constructors.
  bool isSynthetic;

//  List<ElementAnnotation> metadata;
}

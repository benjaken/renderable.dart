import 'package:renderable/src/element/property_accessor_element.dart';
import 'package:renderable/src/element/variable_element.dart';

abstract class PropertyInclucingElement implements VariableElement {
  PropertyAccessorElement getter;

  PropertyAccessorElement setter;
}

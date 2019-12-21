import 'package:renderable/src/element/field_element.dart';
import 'package:renderable/src/util/element_utils.dart';

abstract class FieldElementUtils {
  static FieldElement convertToSetter(FieldElement fieldElement) {
    ElementUtils.changeSynthetic(fieldElement, true);
    ElementUtils.changeSynthetic(fieldElement.getter, true);
    ElementUtils.changeSynthetic(fieldElement.setter, false);
    return fieldElement;
  }

  static FieldElement convertToGetter(FieldElement fieldElement) {
    ElementUtils.changeSynthetic(fieldElement, true);
    ElementUtils.changeSynthetic(fieldElement.getter, false);
    ElementUtils.changeSynthetic(fieldElement.setter, true);
    return fieldElement;
  }

  static FieldElement convertToAccessor(FieldElement fieldElement) {
    ElementUtils.changeSynthetic(fieldElement, true);
    ElementUtils.changeSynthetic(fieldElement.getter, false);
    ElementUtils.changeSynthetic(fieldElement.setter, false);
    return fieldElement;
  }

  static FieldElement convertToField(FieldElement fieldElement) {
    ElementUtils.changeSynthetic(fieldElement, false);
    ElementUtils.changeSynthetic(fieldElement.getter, true);
    ElementUtils.changeSynthetic(fieldElement.setter, true);
    return fieldElement;
  }
}

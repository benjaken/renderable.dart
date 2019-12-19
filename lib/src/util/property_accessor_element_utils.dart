import 'package:renderable/renderable.dart';
import 'package:analyzer/dart/element/element.dart' as az;

abstract class PropertyAccessorElementUtils {
  static PropertyAccessorElement createGetterFromField(FieldElement fieldElement) {
    return PropertyAccessorElement(
      name: fieldElement.name,
      isGetter: true,
      isSetter: false,
      isStatic: fieldElement.isStatic,
      parameters: [],
      returnType: fieldElement.type,
      typeParameters: [],
      isSynthetic: !fieldElement.isSynthetic,
    );
  }

  static PropertyAccessorElement createSetterFromField(FieldElement fieldElement) {
    return PropertyAccessorElement(
      name: fieldElement.name,
      isGetter: false,
      isSetter: true,
      isStatic: fieldElement.isStatic,
      parameters: [
        ParameterElement(
          name: "value",
          type: fieldElement.type,
          isRequired: true,
        ),
      ],
      returnType: DartType.void_,
      typeParameters: [],
      isSynthetic: !fieldElement.isSynthetic,
    );
  }

  static PropertyAccessorElement createCorrespondingGetter(PropertyAccessorElement setter) {
//    return PropertyAccessorElement(
//      name: setter.name,
//      isGetter: true,
//      isSetter: false,
//      isStatic: setter.isStatic,
//      parameters: [
//        ParameterElement(
//          name: "value",
//          type: setter.type,
//          isRequired: true,
//        ),
//      ],
//      returnType: fieldElement.type,
//      type: fieldElement.type,
//      typeParameters: setter.typeParameters,
//      isSynthetic: true,
//    );
  }

  static PropertyAccessorElement createCorrespondingSetter(PropertyAccessorElement getter) {}
}

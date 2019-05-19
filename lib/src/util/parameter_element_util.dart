import 'package:renderable/src/element/parameter_element.dart';

class ParameterElementUtil {
  static String generateParameter(List<ParameterElement> parameters) {
    List<ParameterElement> requiredParameters = parameters.where((e) => e.isRequired).toList();
    List<ParameterElement> namedParameters = parameters.where((e) => e.isNamed).toList();
    List<ParameterElement> optionalPositionalParameters =
        parameters.where((e) => e.isOptionalPositional).toList();

    List<String> templateList = [];

    if (requiredParameters.isNotEmpty) {
      templateList.add(requiredParameters.join(', '));
    }

    if (optionalPositionalParameters.isNotEmpty) {
      templateList.add('[${optionalPositionalParameters.join(', ')}]');
    }

    if (namedParameters.isNotEmpty) {
      templateList.add('{${namedParameters.join(', ')}}');
    }

    return templateList.join(', ');
  }
}

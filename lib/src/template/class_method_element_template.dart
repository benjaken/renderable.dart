const String class_method_element_template = '''
    {{^modifiers.isEmpty}}{{{modifiers}}} {{/modifiers.isEmpty}}{{{returnType}}} {{{name}}}{{{typeParametersString}}}({{{parametersString}}}){{^functionModifiers.isEmpty}} {{{functionModifiers}}}{{/functionModifiers.isEmpty}} {{^isAbstract}}{
      {{{body}}}
    }{{/isAbstract}}
''';

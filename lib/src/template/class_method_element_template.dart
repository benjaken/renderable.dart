const String class_method_element_template = '''
    {{^modifiers.isEmpty}}{{{modifiers}}} {{/modifiers.isEmpty}}{{{returnType}}} {{{name}}}(){{^functionModifiers.isEmpty}} {{{functionModifiers}}}{{/functionModifiers.isEmpty}} {{^isAbstract}}{
      {{{body}}}
    }{{/isAbstract}}
''';
